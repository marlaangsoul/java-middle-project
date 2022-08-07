package com.project3.camping.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.project3.camping.service.productVoService;
import com.project3.camping.utils.uploadFileUtils;
import com.project3.camping.vo.MemberVo;
import com.project3.camping.vo.productVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class productVoController{

	
	@Autowired
	productVoService productVoService;

	public productVoController() {
		System.out.println("@proController 스프링 자동 생성");
	}
//	@GetMapping("/")
//	public String index() {
//		return "index";
//	}


	@RequestMapping(value = "/product")
	public ModelAndView list(@SessionAttribute("member") MemberVo memVo, @RequestParam Map<String, Object> map) {		
		// service
		List<productVo> list = productVoService.list(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", list); // request.setAttribute("data",list)
		if (map.containsKey("keyword")) {  
			mav.addObject("keyword", map.get("keyword"));  
		}  
		mav.setViewName("admin/product"); // list.jsp
		return mav;
	}
	
	@RequestMapping(value = "/productUser")
	public ModelAndView proUserList(@SessionAttribute("member") MemberVo memVo, @RequestParam Map<String, Object> map) {		
		// service
		List<productVo> proUserList = productVoService.proUserList(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", proUserList); // request.setAttribute("data",list)
		if (map.containsKey("keyword")) {  
			mav.addObject("keyword", map.get("keyword"));  
		}  
		mav.setViewName("productUser"); // list.jsp
		return mav;
	}
	
	
	
	@GetMapping("/addProduct")
	public String product() {
		return "admin/addProduct";
	}


	@RequestMapping(value = "/detailProduct")
	public ModelAndView detail(@SessionAttribute("member") MemberVo memVo, productVo productVo) {		
		System.out.println("detail param >>>>>>>" + productVo);
		// service
		productVo detail = productVoService.detail(productVo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", detail); // request.setAttribute("data",list)
		mav.setViewName("detailProduct"); // list.jsp

		return mav;
	};

	@Resource(name="uploadPath")
	private String uploadPath;

//	 https://kuzuro.blogspot.com/2018/10/11.html

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String postaddPorduct(@SessionAttribute("member") MemberVo memVo, productVo productVo, MultipartFile file) throws Exception{

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = uploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file != null) {
			fileName = uploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.jpg";
		}

		productVo.setProImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		productVo.setProThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		productVoService.addProduct(productVo);

		return"redirect:/product";
	}
	
	@RequestMapping(value = "/deleteVo", method = RequestMethod.POST)  
	public ModelAndView deletePost(productVo productVo) {  
		ModelAndView mav = new ModelAndView();  

		boolean isDeleteSuccess = productVoService.remove(productVo);  
		if (isDeleteSuccess) {  
			mav.setViewName("redirect:/product");  
		}else {  
			int proNum = productVo.getProNum();   
			mav.setViewName("redirect:/detailProduct?proNum=" + proNum);  
		}  

		return mav;  
	} 
	
	@RequestMapping(value = "/updateProduct", method = RequestMethod.GET)  
	public ModelAndView update(productVo productVo) {  
		System.out.println("param >>>" + productVo);// {bookId = 3}
		productVo detailMap = productVoService.detail(productVo);  

		ModelAndView mav = new ModelAndView();  
		mav.addObject("data", detailMap);  
		mav.setViewName("/admin/updateProduct");  
		return mav;  
	}  

	
	// 상품 수정
	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
	public ModelAndView postGoodsModify(productVo productVo, MultipartFile file, HttpServletRequest req) throws Exception {

		
		ModelAndView mav = new ModelAndView();  

		boolean isUpdateSuccess = productVoService.edit(productVo);  
		if (isUpdateSuccess) {  
			int proNum = productVo.getProNum();
			System.out.println("productId>>>" + proNum);
			mav.setViewName("redirect:/product");  
		}else {  
			int proNum = productVo.getProNum();
			System.out.println("proNum>>>" + proNum);
			mav = this.update(productVo);  
		}  

	 // 새로운 파일이 등록되었는지 확인
	 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
	  // 기존 파일을 삭제
	  new File(uploadPath + req.getParameter("proImg")).delete();
	  new File(uploadPath + req.getParameter("proThumbImg")).delete();
	  
	  // 새로 첨부한 파일을 등록
	  String imgUploadPath = uploadPath + File.separator + "imgUpload";
	  String ymdPath = uploadFileUtils.calcPath(imgUploadPath);
	  String fileName = uploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	  
	  productVo.setProImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	  productVo.setProThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	  
	 } else { // 새로운 파일이 등록되지 않았다면
	  // 기존 이미지를 그대로 사용
		 productVo.setProImg(req.getParameter("gdsImg"));
	 productVo.setProThumbImg(req.getParameter("gdsThumbImg"));
	  
	 }
	 
	 productVoService.edit(productVo);
	 
	 return mav;
	}

	
	
}
