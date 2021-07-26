package com.wj.kstudy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wj.kstudy.dto.Board;
import com.wj.kstudy.dto.Criteria;
import com.wj.kstudy.service.BoardService;


@RestController
public class BoardController {
	
	@Autowired 
	BoardService boardService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
//	@GetMapping("/studyboard/{groupId}")
//	public List<Board> getBoardList(@PathVariable(name="groupId")int groupId){
//		return boardService.getPostList(groupId);
//	}
	
	//게시글 목록 조회
	@GetMapping("/studyboard/{groupId}")
	public List<Board> getBoardList(@PathVariable(name="groupId")int groupId){
		return boardService.getPostList(groupId);
	}
	
	//게시글 목록 조회 페이징
//	@GetMapping("/studyboard/{groupId}/{page}")
//	public List<Board> getBoardListPaging(@PathVariable(name="groupId")int groupId, @PathVariable(name="page")int page, @ModelAttribute("criteria") Criteria criteria){
//		criteria.setCurrentPageNo(page);
//		return boardService.getPostListPaging(groupId, criteria);
//	}
	
	@GetMapping("/studyboard/{groupId}/{page}")
	public List<Board> getBoardListPaging2(@PathVariable(name="groupId")int groupId, @PathVariable(name="page")int page, Criteria criteria){
		criteria.setGroupId(groupId);
		criteria.setCurrentPageNo(page);
		return boardService.getPostListPaging2(criteria);
	}
	
	//게시글 작성
	@PostMapping("/studyboard")
	public int addPost(HttpSession session, @RequestBody Board board) {
		String userId = session.getAttribute("user_id").toString();
		//String encodedUserId = passwordEncoder.encode(userId);
		board.setUserId(userId);
		board.setRegUser(session.getAttribute("nickname").toString());
		return boardService.addPost(board);
	}
	
	//게시글 삭제
//	@DeleteMapping("/studyboard/{boardId}")
//	public ResponseEntity<Map<String,String>> deletePost(@PathVariable(name="boardId") int boardId) throws JsonProcessingException {
//		Map<String, String> map = new HashMap<>();
//		if(boardService.deletePost(boardId)==1) {
//			map.put("result", "success");
//		}
//		else {
//			map.put("result", "false");
//		}
//		
//		ResponseEntity<Map<String,String>> responseEntity = new ResponseEntity<Map<String, String>>(map, HttpStatus.OK);
//		ObjectMapper objectMapper = new ObjectMapper();
//		String jsonString = objectMapper.writeValueAsString(responseEntity);
//		
//		System.out.println(jsonString);
//		
//		return responseEntity;
//			
//	}
	
	@PutMapping("/studyboard/{boardId}")
	public int deleteUpdatePost(@PathVariable(name="boardId") int boardId) {
		return boardService.deleteUpdatePost(boardId);
	}
	
	
	//게시글 수정
	@PutMapping("/studyboard")
	public int updatePost(@RequestBody Board board) {		
		return boardService.updateBoard(board);
	}
	
	//게시글 상세 조회
	@GetMapping("/studyboard/detail/{boardId}")
	public Board getPost(@PathVariable(name="boardId") int boardId) {
		return boardService.getPost(boardId);
	}
		
	//검색 조건에 따른 게시글 조회
	@GetMapping("/studyboard/{groupId}/search/{option}/{keyword}/{page}")
	public List<Board> getBoardListSearchTC(Criteria criteria, @PathVariable(name="groupId")int groupId, @PathVariable(name="option")int option, @PathVariable(name="keyword")String keyword, @PathVariable(name="page")int page){
		return boardService.getSearchListPaging(criteria, groupId, option, keyword, page);
	}
	
	//제목+내용 검색 결과 개수 조회
	@GetMapping("/studyboard/countTC/{groupId}/{keyword}")
	public int countSearchTC(Criteria criteria, @PathVariable(name="groupId")int groupId, @PathVariable(name="keyword") String keyword) {
		return boardService.getTotalTC(criteria, groupId, keyword);
	}

	//작성자 검색 결과 개수 조회
	@GetMapping("/studyboard/countW/{groupId}/{keyword}")
	public int countSearchW(Criteria criteria, @PathVariable(name="groupId")int groupId, @PathVariable(name="keyword") String keyword) {
		return boardService.getTotalW(criteria, groupId, keyword);
	}
	
	@GetMapping("/studyboard/count/{groupId}")
	public int countTotalPost(@PathVariable(name="groupId")int groupId) {
		return boardService.getTotalPost(groupId);
	}
	
}
