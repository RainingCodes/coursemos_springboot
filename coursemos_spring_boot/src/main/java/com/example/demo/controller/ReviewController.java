package com.example.demo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.domain.Course;
import com.example.demo.domain.Member;
import com.example.demo.domain.Points;
import com.example.demo.domain.Review;
import com.example.demo.domain.ReviewLike;
import com.example.demo.domain.ReviewReadableMember;
import com.example.demo.domain.SessionMember;
import com.example.demo.service.CourseService;
import com.example.demo.service.MemberService;
import com.example.demo.service.PointsService;
import com.example.demo.service.ReviewLikeService;
import com.example.demo.service.ReviewReadableMemberService;
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
	@Autowired
	private ReviewLikeService reviewLikeService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private ReviewReadableMemberService reviewReadableMemberService;
	
	
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
		Review review;

		review = new Review();
		review.setMemberId(sessionMember.getId());
		mv.addObject("sessionMember", sessionMember);
		mv.addObject("review", review);
		return mv;
	}
	@RequestMapping(value = "/review/register/{courseId}", method = RequestMethod.POST)
	public String form(HttpSession session, @ModelAttribute SessionMember sessionMember, @Valid Review review, BindingResult result, @PathVariable("courseId") int id,
			Model model) {
		if(result.hasErrors()) {
			return "thyme/review/register"; // ?????? ?????? ?????? ??? ?????? form?????? ??????
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
		
		Course course = courseService.getCourseByCourseId(id);
		review.setCourseName(course.getCourseName());
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
		
		session.setAttribute("sessionMember", sessionMember);
		reviewReadableMemberService.save(new ReviewReadableMember(review.getMemberId(), review.getReviewId()));
		return "redirect:/review/registered/" + Long.toString(review.getReviewId());
	}
	
	
	@RequestMapping(value = "/review/registered/{reviewId}")
	public ModelAndView viewDetail(@ModelAttribute SessionMember sessionMember, @PathVariable("reviewId") Long id) {
		ModelAndView mv = new ModelAndView("thyme/review/registered");
		Review review = reviewService.findReviewById(id);
		Member member = memberService.findMemberById(review.getMemberId());
		boolean isWriter = review.getMemberId().equals(sessionMember.getId());
		boolean like = false;
		if(!isWriter) {
			//reviewLike ??????
			like = reviewLikeService.findReviewLikeByReviewIdMemberId(review.getReviewId(), sessionMember.getId());
			
		}
		Course course = courseService.getCourseByCourseId(review.getCourseId());
		review.setCourseName(course.getCourseName());
		mv.addObject("sessionMember", sessionMember);
		mv.addObject("review", review);
		mv.addObject("isWriter", isWriter);
		mv.addObject("like", like); 
		mv.addObject("writer", member.getNickName());

		return mv;
	}
	
	
	@RequestMapping(value = "/review/view/{reviewId}")
	public ModelAndView view(@ModelAttribute SessionMember sessionMember, @PathVariable("reviewId") Long id) {
		ModelAndView mv = new ModelAndView("thyme/review/view");
		Review review = reviewService.findReviewById(id);
		Member member = memberService.findMemberById(review.getMemberId());
		boolean isWriter = review.getMemberId().equals(sessionMember.getId());
		boolean like = false;
		if(!isWriter) {
			//reviewLike ??????
			like = reviewLikeService.findReviewLikeByReviewIdMemberId(review.getReviewId(), sessionMember.getId());
			
		}
		Course course = courseService.getCourseByCourseId(review.getCourseId());
		review.setCourseName(course.getCourseName());
		mv.addObject("sessionMember", sessionMember);
		mv.addObject("review", review);
		mv.addObject("isWriter", isWriter);
		mv.addObject("like", like); 
		mv.addObject("writer", member.getNickName());

		return mv;
	}
	
	
	
	private String uploadFile(Long memberId, MultipartFile photo) {
		File folder = new File(this.uploadDir + Long.toString(memberId));
		System.out.println(folder.mkdir());
		String filename = UUID.randomUUID().toString() 
						+ "_" + photo.getOriginalFilename();
		if(photo.getOriginalFilename().length() == 0)
			return null;
		System.out.println(memberId + "??? ????????? ??? ??????: "	+ filename);
		File file = new File(folder + File.separator + filename);
		try {
			photo.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return Long.toString(memberId) + File.separator + filename;
	}
	

	
	@GetMapping(value = "/course/{courseId}/review/list") 
	public ModelAndView viewList(@PathVariable("courseId") int id, HttpServletResponse response) throws IOException{
		List<Review> reviews = reviewService.findReviewByCourseId(id);
		ModelAndView mv = new ModelAndView("review/reviewList");
		return mv;
	}
	
	@GetMapping(value = "/review/list")
	public ModelAndView myReviewList(@ModelAttribute SessionMember sessionMember, HttpServletResponse response) throws IOException{
		List<Review> reviews = reviewService.findReviewByMemberId(sessionMember.getId());
		ModelAndView mv = new ModelAndView("member/reviewList");
		mv.addObject("reviews", reviews);
		return mv;
	}
	
	@RequestMapping(value = "/review/delete/{reviewId}")
	public ModelAndView delete(@ModelAttribute SessionMember sessionMember, @PathVariable("reviewId") Long id) {
		ModelAndView mv = new ModelAndView("redirect:/review/list");
		Review review = reviewService.findReviewById(id);
		List<ReviewLike> rll = reviewLikeService.findReviewLikeByReviewId(id);
		if(rll != null) {
			for(ReviewLike rl : rll) {
				reviewLikeService.delete(rl);
			}
		}
		List<ReviewReadableMember> rrml= reviewReadableMemberService.findReviewReadableMemberByReviewId(id);
		if(rrml != null) {
			for(ReviewReadableMember rrm : rrml) {
				reviewReadableMemberService.delete(rrm);
			}
		}
		reviewService.delete(review);
		return mv;
	}
}
