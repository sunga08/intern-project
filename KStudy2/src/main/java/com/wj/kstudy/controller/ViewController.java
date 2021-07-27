package com.wj.kstudy.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.wj.kstudy.NaverLoginBO;
import com.wj.kstudy.dto.Board;
import com.wj.kstudy.dto.Criteria;
import com.wj.kstudy.dto.Lecture;
import com.wj.kstudy.dto.Schedule;
import com.wj.kstudy.dto.StudyGroup;
import com.wj.kstudy.dto.UserDto;
import com.wj.kstudy.service.BoardService;
import com.wj.kstudy.service.KMoocListService;
import com.wj.kstudy.service.LoginService;
import com.wj.kstudy.service.ScheduleService;
import com.wj.kstudy.service.StudyGroupService;
import com.wj.kstudy.service.TestService;

@Controller
public class ViewController {
	
	@Autowired
	TestService testService;
	
	@Autowired
	KMoocListService kmoocListService;
	
	@Autowired
	StudyGroupService studyGroupService;
	
	@Autowired
	ScheduleService scheduleService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	LoginService loginService;
	
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@GetMapping("/post")
	public String test(Model model) {
		UserDto user1 = new UserDto("sunga","pwd1234");
		UserDto user2 = new UserDto("sunga2","pwd12345");
		UserDto user3 = new UserDto("sunga3","pwd123456");
		
		List<UserDto> list = new ArrayList<>();
		
		list.add(user1);
		list.add(user2);
		list.add(user3);
		
		
		model.addAttribute("list",list);
		
		return "test";
	}
	
	@RequestMapping("/test") //mybatis 테스트용
	public ModelAndView test() throws Exception{
		ModelAndView mav = new ModelAndView("test2");
		List<UserDto> userList = testService.selectUser();
		int cnt = testService.countUser();
		
		mav.addObject("list",userList);
		mav.addObject("cnt", cnt);
		mav.setViewName("test2");
		return mav;
	}
	
	@RequestMapping("/main") //메인화면
	public ModelAndView main(HttpSession session) throws Exception{
//		Cookie cookie = new Cookie("view",null);
//		cookie.setComment("게시글 조회수");
//		cookie.setMaxAge(60*60*24*365);
		ModelAndView mav = new ModelAndView("index");
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		
		if(session.getAttribute("user_id")!=null) {
			String nickname=session.getAttribute("nickname").toString();
			mav.addObject("nickname", nickname);
		}
				
		mav.setViewName("index");
		
		//네이버
		mav.addObject("url", naverAuthUrl);
		
		return mav;
	}
	
	//강의 상세페이지 화면
	@RequestMapping("/view/detail") 
	public ModelAndView detail(HttpSession session) {
		ModelAndView mav = new ModelAndView("detail");
		
		if(session.getAttribute("user_id")!=null) {
			String nickname = session.getAttribute("nickname").toString();
			mav.addObject("nickname", nickname);
		}
		
		mav.setViewName("detail");
		return mav;
	}
	
//	@GetMapping("/details/{lecId}")
//	public ModelAndView getLectureById(@PathVariable(name="lecId") String id) {
//		Lecture lecture = kmoocListService.getLectureById(id);
//		ModelAndView mav = new ModelAndView("detail");
//		
//		mav.addObject("lecture", lecture);
//
//		mav.setViewName("detail");
//		
//		return mav;
//	}
	
//	@RequestMapping("/studygroup/view/{lecId}") //스터디 그룹 생성 폼
//	public ModelAndView createStudy() {
//		ModelAndView mav = new ModelAndView("createStudyForm");
//		mav.setViewName("createStudyForm");
//		
//		return mav;
//	}
	
	//스터디 그룹 생성 폼
	@RequestMapping("/studygroup/add/{lecId}") 
	public ModelAndView createStudy(@PathVariable(name="lecId") String lecId) {
		Lecture lecture = kmoocListService.getLectureById(lecId);
		
		ModelAndView mav = new ModelAndView("createStudyForm");
		mav.setViewName("createStudyForm");
		mav.addObject("lecture",lecture);
		
		return mav;
	}
	
	//스터디 정보 화면
	@GetMapping("view/info/{groupId}")
	public ModelAndView infoView(HttpSession session, @PathVariable(name="groupId") int groupId) {
		String user_id = session.getAttribute("user_id").toString();
		
		StudyGroup studyGroup = studyGroupService.getOneStudyGroup(groupId);
		//체크하는 Service
		ModelAndView mav = new ModelAndView("studyInfo");
		mav.addObject("groupInfo", studyGroup);
		mav.setViewName("detail_studygroup");
		
		return mav;
	}
	
	//스터디 일정관리 화면
	@GetMapping("view/schedule/{groupId}")
	public ModelAndView scheduleView(HttpSession session, @PathVariable(name="groupId") int groupId) {
		//String user_id = session.getAttribute("user_id").toString();
		
		ModelAndView mav = new ModelAndView("scheduleView");
		
		StudyGroup studyGroup = studyGroupService.getOneStudyGroup(groupId);
		mav.addObject("groupInfo", studyGroup);
		mav.setViewName("schedule");
		
		return mav;
	}
	
	
	//스터디 정보 수정 폼
	@GetMapping("/studygroup/edit/{groupId}") 
	public ModelAndView updateStudyView(@PathVariable(name="groupId") int groupId) {		
		return test(groupId, "modifyStudyForm", "studyGroup");
	}

	private ModelAndView test(int param, String viewName, String objectName) {
		StudyGroup studyGroup = studyGroupService.getOneStudyGroup(param);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.setViewName(viewName);
		mav.addObject(objectName, studyGroup);
		return mav;
	}
	
	//일정 추가 폼
	@GetMapping("view/schedule/add/{groupId}")
	public ModelAndView addScheduleView(HttpSession session, @PathVariable(name="groupId") int groupId) {
		StudyGroup studyGroup = studyGroupService.getOneStudyGroup(groupId);
		
		ModelAndView mav = new ModelAndView("addScheduleView");
		mav.setViewName("addScheduleForm");
		mav.addObject("studyGroup", studyGroup);
		
		return mav;
	}

	//일정 수정 폼
	@GetMapping("view/schedule/edit/{scheduleId}")
	public ModelAndView updateScheduleView(@PathVariable(name="scheduleId") int scheduleId) {
		Schedule schedule = scheduleService.getSchedule(scheduleId);
		
		ModelAndView mav = new ModelAndView("modifyScheduleFrom");
		mav.setViewName("modifyScheduleForm");
		mav.addObject("schedule", schedule);
		
		return mav;
	}
	
	//스터디 자유게시판 화면
	@GetMapping("view/studyboard/{groupId}")
	public ModelAndView studyBoardView(HttpSession session, @PathVariable(name="groupId") int groupId) {
		String user_id = session.getAttribute("user_id").toString();
		ModelAndView mav = new ModelAndView("studyBoardView");
		StudyGroup studyGroup = studyGroupService.getOneStudyGroup(groupId);
		
		Criteria criteria = new Criteria();
		
		mav.addObject("groupInfo", studyGroup);		
		mav.addObject("criteria", criteria);
		mav.setViewName("studyboard");
		
		
		return mav;
	}

	//게시글 상세
	@GetMapping("/view/studyboard/detail/{groupId}/{boardId}")
	public ModelAndView boardDetailView(HttpServletRequest request, HttpServletResponse response, HttpSession session, @PathVariable(name="groupId") int groupId, @PathVariable(name="boardId") int boardId) {
		Board board = boardService.getPostAndPlusView(request, response, session, boardId);
		StudyGroup studyGroup = studyGroupService.getOneStudyGroup(groupId);
		
		ModelAndView mav = new ModelAndView("boardDetailView");
				
		mav.addObject("post",board);
		mav.setViewName("viewPost");
		mav.addObject("user",session.getAttribute("nickname"));
		mav.addObject("groupInfo",studyGroup);
		
		return mav;
	}
	
	//글쓰기 화면
	@GetMapping("/view/studyboard/write/{groupId}")
	public ModelAndView writePostView(@PathVariable(name="groupId") int groupId) {
		StudyGroup studyGroup = studyGroupService.getOneStudyGroup(groupId);
		
		ModelAndView mav = new ModelAndView("writePostView");
		mav.setViewName("writePost");
		mav.addObject("groupInfo",studyGroup);
		
		return mav;
	}
	
	@GetMapping("/view/studyboard/update/{groupId}/{boardId}")
	public ModelAndView updatePostView(@PathVariable(name="groupId") int groupId, @PathVariable(name="boardId") int boardId) {
		Board board = boardService.getPost(boardId);
		StudyGroup studyGroup = studyGroupService.getOneStudyGroup(groupId);
		
		ModelAndView mav = new ModelAndView("updatePostView");
		mav.setViewName("modifyPost");
		mav.addObject("post",board);
		mav.addObject("groupInfo",studyGroup);
		
		return mav;
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/main/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		System.out.println("여기는 callback");
		ModelAndView mav = new ModelAndView("callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		/** apiResult json 구조
		{"resultcode":"00",
		"message":"success",
		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		
		String userId = (String)response_obj.get("id");
		
		//response의 nickname값 파싱
		String nickname = (String)response_obj.get("nickname");
		System.out.println("nickname: "+nickname);
		
//		String email = (String)response_obj.get("email");
//		System.out.println("email: "+email);

		System.out.println(response_obj.toString());
		//4.파싱 닉네임 세션으로 저장
		session.setAttribute("user_id",userId); //세션 생성
		session.setAttribute("nickname", nickname);
		//model.addAttribute("result", apiResult);
				
		loginService.signup(session);
		
		mav.addObject("result", apiResult);
		mav.addObject("nickname",nickname);				
		mav.setViewName("loginRedirect");
		
		return mav;
	}
	
	//로그아웃
//	@RequestMapping(value = "/logout/naver", method = { RequestMethod.GET, RequestMethod.POST })
//	public ModelAndView logout(HttpSession session)throws IOException {
//		System.out.println("여기는 logout");
//		ModelAndView mav = new ModelAndView("logout");
//		session.invalidate();
//		mav.setViewName("index");
//		return mav;
//	}

}
