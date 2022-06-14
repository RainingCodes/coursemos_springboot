package com.example.demo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

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
	public String form(HttpSession session, @ModelAttribute SessionMember sessionMember, @PathVariable("courseId") Long id) {
		Review review = new Review();
		review.setCourseId(id);
		review.setMemberId(sessionMember.getId());
		session.setAttribute("review", review);
		session.setAttribute("nickName", sessionMember.getNickName());
		session.setAttribute("points", sessionMember.getPoints());
		ArrayList<Points> pointList = new ArrayList<>();
		List<Points> pList = sessionMember.getPointList();
		int size = sessionMember.getPointList().size();
		int count = 0;
		for(int i = size - 1; i >= 0; i--) {
			pointList.add(pList.get(i));
			count++;
			if(count == 3) {
				break;
			}
		}
		session.setAttribute("pointList", pointList);
		session.setAttribute("size",sessionMember.getPointList().size() - 4);
		
		return "thyme/review/register";
	}
	@RequestMapping(value = "/review/register/{courseId}", method = RequestMethod.POST)
	public String form(@RequestParam(value = "reviewContents") String reviewContents,@RequestParam(value = "counter") String counter, HttpSession session, @ModelAttribute SessionMember sessionMember, @ModelAttribute Review review, @PathVariable("courseId") Long id,
			Model model) {
		System.out.println(review);
		Long memberId = sessionMember.getId();
		MultipartFile photo = review.getPhoto();
		if(photo != null) {
			System.out.println(photo);
			String filename = uploadFile(memberId, photo);
			session.setAttribute("filename", null);
			
			model.addAttribute("fileUrl", this.uploadDirLocal + filename);
			review.setPhotos(this.uploadDirLocal + filename);
		} else {
			review.setPhotos(null);
		}
		java.util.Date date = new java.util.Date();
		long timeInMilliSeconds = date.getTime();
		review.setWrittenDate(new Date(timeInMilliSeconds)); 
		review.setNickName(sessionMember.getNickName());
		reviewService.insertReview(review);
		System.out.println(review);
		session.setAttribute("review", review);
		session.setAttribute("nickName", sessionMember.getNickName());
		Points points = new Points();
		points.setMemberId(sessionMember.getId());
		points.setPointsDate(review.getWrittenDate());
		points.setType(2);
		sessionMember.setPoints(sessionMember.getPoints() + 20);
		Member member= memberService.findMemberById(sessionMember.getId());
		pointsService.insertPoints(points);
		List<Points> pointList = pointsService.findAllByMemberId(sessionMember.getId());
		sessionMember.setPointList(pointList);
		member.insertPoints(points);
		member.setPoints(member.getPoints() + 20);
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
