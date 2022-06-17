package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Member;
import com.example.demo.domain.Points;
import com.example.demo.domain.Review;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.MemberService;
import com.example.demo.service.ReviewService;

@Controller
@SessionAttributes("sessionMember")
public class UpdateReviewController implements ApplicationContextAware{
	@Value("/upload/")
	private String uploadDirLocal;
	private WebApplicationContext context;	
	private String uploadDir;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MemberService memberService;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		// TODO Auto-generated method stub
		this.context = (WebApplicationContext) applicationContext;
		this.uploadDir = context.getServletContext().getRealPath(this.uploadDirLocal);
		System.out.println(this.uploadDir);
	}
	
	@RequestMapping(value = "/review/update/{reviewId}", method = RequestMethod.GET)
	public ModelAndView update(@ModelAttribute SessionMember sessionMember, @PathVariable("reviewId") Long id) {
		Review review = reviewService.findReviewById(id);
		ModelAndView mv = new ModelAndView("thyme/review/update");
		System.out.println(review);
		mv.addObject("review", review);
		return mv;
	}
	@RequestMapping(value = "/review/update/{reviewId}", method = RequestMethod.POST)
	public String updated(HttpSession session, @ModelAttribute SessionMember sessionMember, @Valid Review review, BindingResult result, @PathVariable("reviewId") String id,
			Model model) {
		if(result.hasErrors()) {
			return "thyme/review/update"; // 검증 오류 발생 시 입력 form으로 이동
		}
		Review r = reviewService.findReviewById(review.getReviewId());
		review.setMemberId(r.getMemberId());
		review.setCourseId(r.getCourseId());
		MultipartFile photo = review.getPhoto();
		String filename = uploadFile(review.getMemberId(), photo);
		if(filename == null) {
			review.setPhotos(null);
		} else {
			model.addAttribute("fileUrl", this.uploadDirLocal + filename);
			review.setPhotos(this.uploadDirLocal + filename);
		}
		java.util.Date date = new java.util.Date();
		long timeInMilliSeconds = date.getTime();
		review.setWrittenDate(new Date(timeInMilliSeconds)); 
		System.out.println(review);
		reviewService.insertReview(review);

		session.setAttribute("review", review);
		
		session.setAttribute("sessionMember", sessionMember);
		return "redirect:/review/registered/" + Long.toString(review.getReviewId());
	}
	private String uploadFile(Long memberId, MultipartFile photo) {
		File folder = new File(this.uploadDir + Long.toString(memberId));
		System.out.println(folder.mkdir());
		String filename = UUID.randomUUID().toString() 
						+ "_" + photo.getOriginalFilename();
		if(photo.getOriginalFilename().length() == 0)
			return null;
		System.out.println(memberId + "가 업로드 한 파일: "	+ filename);
		File file = new File(folder + File.separator + filename);
		try {
			photo.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return Long.toString(memberId) + File.separator + filename;
	}
}
