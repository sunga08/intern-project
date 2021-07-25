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


import com.wj.kstudy.dto.Comment;
import com.wj.kstudy.service.CommentService;

@RestController
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	//댓글 목록
	@GetMapping("/comments/{groupId}/{boardId}")
	public List<Comment> getComments(@PathVariable(name="groupId") int groupId, @PathVariable(name="boardId") int boardId){
		return commentService.getComments(groupId, boardId);
	}
	
	//원댓 등록
	@PostMapping("/comment")
	public int insertComment(HttpSession session, @RequestBody Comment comment) {
		return commentService.insertComment(session, comment);
	}
	
	//대댓 등록
	@PostMapping("/comment/reply")
	public int insertReplyComment(HttpSession session, @RequestBody Comment comment) {
		return commentService.insertReplyComment(session, comment);
	}
	
	//댓글 삭제
//	@DeleteMapping("/comment/{commentId}")
//	public int deleteComment(@PathVariable(name="commentId") int commentId) {
//		return commentService.deleteComment(commentId);
//	}
	
	//삭제된 댓글로 업뎃
	@PutMapping("/comment/{commentId}")
	public int updateDeleteComment(@PathVariable(name="commentId") int commentId) {
		return commentService.updateDeleteComment(commentId);
	}
	
	
	//댓글 수정
	@PutMapping("/comment")
	public int updateComment(@RequestBody Comment comment) {
		return commentService.updateComment(comment);
	}
	
	@GetMapping("/reply/count/{groupId}/{bundleId}")
	public int countReply(@PathVariable(name="groupId") int groupId, @PathVariable(name="bundleId") int bundleId) {
		return commentService.countReply(groupId, bundleId);
	}
}
