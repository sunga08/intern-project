package com.wj.kstudy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.wj.kstudy.dto.Board;
import com.wj.kstudy.service.BoardService;


@RestController
public class BoardController {
	@Autowired 
	BoardService boardService;
	
	@GetMapping("/studyboard/{groupId}")
	public List<Board> getBoardList(@PathVariable(name="groupId")int groupId){
		return boardService.getPostList(groupId);
	}
	
	@PostMapping("/studyboard")
	public int addPost(HttpSession session, @RequestBody Board board) {
		board.setUserId(session.getAttribute("user_id").toString());
		return boardService.addPost(board);
	}
	
	@DeleteMapping("/studyboard/{boardId}")
	public int deletePost(@PathVariable(name="boardId") int boardId) {
		return boardService.deletePost(boardId);
	}
	
	@PutMapping("/studyboard")
	public int updatePost(@RequestBody Board board) {		
		return boardService.updateBoard(board);
	}
}
