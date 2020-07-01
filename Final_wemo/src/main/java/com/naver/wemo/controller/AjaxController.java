package com.naver.wemo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.wemo.DAO.MemberDAO;
import com.naver.wemo.DAO.MemoDAO;
import com.naver.wemo.domain.Member;
import com.naver.wemo.domain.Memo;

@Controller
public class AjaxController {

	@Autowired
	MemoDAO memodao;
	
	@Autowired
	MemberDAO memberdao;
	
	@ResponseBody
	@RequestMapping("/studyNew")
	public void newStudy(Memo memo){//memo 에서 study 넣기
		
		memodao.newInsert(memo);
	}
	
	@ResponseBody
	@RequestMapping("/moneyNew")
	public void newMoney(Memo memo){
		
		memodao.newInsert(memo);
	}
	
	@ResponseBody
	@RequestMapping("/healthNew")
	public void newHealth(Memo memo){
		
		memodao.newInsert(memo);
	}
	
	@ResponseBody
	@RequestMapping("/getStudy")
	public List<Memo> getStudy(Member member) {
		
		return memodao.selectStudy(member);
		
	}
	@ResponseBody
	@RequestMapping("/getMoney")
	public List<Memo> getMoney(Member member) {
		
		return memodao.selectMoney(member);
		
	}
	@ResponseBody
	@RequestMapping("/getHealth")
	public List<Memo> getHealth(Member member) {
		
		return memodao.selectHealth(member);
		
	}
	
	@GetMapping("/join")
	public String join() {
		return "join";
	}
	
	@RequestMapping(value = "/login.net", method = RequestMethod.GET)
	public String home() {
		
		
		return "login";
	}
	
	@PostMapping(value="/loginProcess")
	public void loginProcess(@RequestParam(value="USER_EMAIL") String id,
			@RequestParam(value="USER_PASS") String pass, 
			HttpServletResponse response,
			HttpSession session) throws IOException{
		
		Member member = new Member();
		member.setUSER_EMAIL(id);
		
		member = memberdao.isId(member);
		
		int result = -1;//아이디가 존재 하지 않음
		if(member!=null) {
			if(member.getUSER_PASS().equals(pass) && member.getUSER_EMAIL().equals(id)) {
				result =1;
			}else if(!member.getUSER_PASS().equals(pass) && member.getUSER_EMAIL().equals(id)) {
				result =0;
			}
		}
		System.out.println(result);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(result ==1) {
			
			//로그인 성공
			session.setAttribute("USER_EMAIL", id);
			
//			Cookie savecookie = new Cookie("saveid",id);
//			if(!remember.equals("")) {
//				savecookie.setMaxAge(60*60);
//				System.out.println("쿠키 저장 : 60* 60");
//			}else {
//				System.out.println("쿠키 저장 : 0");
//				savecookie.setMaxAge(0);
//			}
//			response.addCookie(savecookie);
			
			out.println("alert('환영합니다! "+member.getUSER_EMAIL()+"님');");
			out.println("");
			out.println("location.href='memo?USER_EMAIL="+id+"'");
			out.println("</script>");
			out.close();


		}else if(result == 0) {
			result=0;//아이디는 있고 비밀번호 틀림
			out.println("alert('비밀번호가 틀렸습니다.');");
			out.println("history.balck();");
			out.println("</script>");
			out.close();
		}else if(result == -1) {
			out.println("alert('아이디가 존재하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			
		}

		
		
	}
	
	@RequestMapping(value="/memo" , method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView goMemo(@RequestParam(value="USER_EMAIL") String id,ModelAndView mv){//section 값 추가해서 ajax 이쪽으로 보내기 section 버튼 누를 시
		
		Member member = new Member();
		member.setUSER_EMAIL(id);
		Member mem = memberdao.isId(member);//아이디 받아오기
		List<Memo> memolist = new ArrayList<Memo>();
		String lastsection = mem.getUSER_SUB();
		System.out.println("여기?0");
			if(lastsection.equals("STUDY")) {
				
				memolist =memodao.selectStudy(mem);
				System.out.println(memolist.get(0).getMEMO_TEX());
			}else if(lastsection.equals("MONEY")) {
				
				memolist =memodao.selectMoney(mem);
			}else if(lastsection.equals("HEALTH")) {
				
				memolist =memodao.selectHealth(mem);
			}	
			
			mv.addObject("USER_SUB", lastsection);
			mv.addObject("memolist", memolist);
			mv.setViewName("memo");
		return mv;
	}
	
	@RequestMapping(value = "/toMain",method = RequestMethod.GET)
	public String index2() {
		return "wemo_main";
	}
	
	
	@PostMapping(value="/joinProcess")
	public void joinProcess(Member member,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		int result = -1;
		
		memberdao.insertMember(member);
		Member mem = memberdao.isId(member);//아이디 잘 들어 갔는지 확인
		if(mem != null) {
			result =1;
		}
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(result ==1) {
			out.println("alert('"+member.getUSER_EMAIL()+"님 회원가입을 축하드립니다.');");
			out.println("location.href='login.net'");
			out.println("</script>");
		}else {
			out.println("alert('회원가입에 실패하였습니다.';");
			out.println("history.back()");
			out.println("</script>");			
		}
		out.close();
		
		
	}
	
	@GetMapping(value="/idcheck.net")
	public void idcheck(Member member,HttpServletResponse response) throws IOException{
		Member mem = memberdao.isId(member);
		int result =-1;
		if(mem != null) {
			result =1;
		}		
		response.setContentType("text/thml;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}
	@ResponseBody
	@GetMapping(value="/newMemo")
	public void newMemo(Memo memo) {
		memodao.newInsert(memo);
	}
	
	
	
}