package com.example.demo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
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
import com.example.demo.service.PointsService;
import com.example.demo.service.ReviewService;

import java.util.List;


@Controller
@SessionAttributes({"sessionMember", "review"})
public class ReviewController implements ApplicationContextAware{
	@Value("/upload/")
	private String uploadDirLocal;
	private WebApplicationContext context;	
	private String uploadDir;
	@Autowired
	private PointsService pointsService;
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
	
	
	

	@RequestMapping(value = "/review/register/{courseId}", method = RequestMethod.GET)
	public ModelAndView form(HttpSession session, @ModelAttribute SessionMember sessionMember, @PathVariable("courseId") String id) {
		ModelAndView mv = new ModelAndView("thyme/review/register");
		Review review = new Review();
		review.setMemberId(sessionMember.getId());
		review.setNickName(sessionMember.getNickName());
		mv.addObject("review", review);
		return mv;
	}
	@RequestMapping(value = "/review/register/{courseId}", method = RequestMethod.POST)
	public String form(HttpSession session, @ModelAttribute SessionMember sessionMember, @Valid Review review, BindingResult result, @PathVariable("courseId") String id,
			Model model) {
		System.out.println(review);
		if(result.hasErrors()) {
			
			return "thyme/review/register"; // 검증 오류 발생 시 입력 form으로 이동
		}
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
		reviewService.insertReview(review);

		session.setAttribute("review", review);
		
		Points points = new Points();
		points.setMemberId(sessionMember.getId());
		points.setPointsDate(review.getWrittenDate());
		points.setType(2);
		
		Member member= memberService.findMemberById(sessionMember.getId());
		member.insertPoints(points);
		member.setPoints(member.getPoints() + 20);
		pointsService.insertPoints(points);
		List<Points> pointList = pointsService.findAllByMemberId(sessionMember.getId());
		
		sessionMember.setPoints(sessionMember.getPoints() + 20);
		sessionMember.setPointList(pointList);
		System.out.println(sessionMember);
		
		memberService.save(member);
		return "forward:/review/registered/" + Long.toString(review.getReviewId());
	}
	
	@RequestMapping(value = "/review/registered/{reviewId}")
	public String viewDetail(@ModelAttribute SessionMember sessionMember, HttpSession session, @PathVariable("reviewId") Long id,
			Model model) {
		Review review = reviewService.findReviewById(id);
		session.setAttribute("review", review);
		return "thyme/review/registered";
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
