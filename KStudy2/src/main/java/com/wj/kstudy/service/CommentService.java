package com.wj.kstudy.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wj.kstudy.dto.Comment;
import com.wj.kstudy.mapper.CommentMapper;

@Service
public class CommentService {

	@Autowired
	CommentMapper commentMapper;
	
	//댓글 목록
	public List<Comment> getComments(int groupId, int boardId){
		return commentMapper.getComments(groupId, boardId);
	}
	
	//원글 댓글 추가
	public int insertComment(HttpSession session, Comment comment) {
		comment.setRegUser(session.getAttribute("nickname").toString());
		int bundleCnt = commentMapper.countBundle(comment.getGroupId()); //원댓 개수
		comment.setBundleId(bundleCnt+1);
		comment.setBundleOrder(0);
		comment.setDepth(0);
		
		return commentMapper.insertComment(comment);
	}
	
	//대댓글 추가
	public int insertReplyComment(HttpSession session, Comment comment) {
		comment.setRegUser(session.getAttribute("nickname").toString());
		int bundleCommentCnt = commentMapper.countBundleComment(comment.getGroupId(), comment.getBundleId()); //원댓에 달린 대댓 개수(원댓 포함)
		comment.setBundleOrder(bundleCommentCnt);
		comment.setDepth(1);
		System.out.println(comment.getContent());
		
		return commentMapper.insertComment(comment);
	}
	
	//댓글 삭제
	public int deleteComment(int commentId) {
		return commentMapper.deleteComment(commentId);
	}
	
	//삭제된 댓글로 업뎃
	public int updateDeleteComment(int commentId) {
		Comment comment = commentMapper.getOneComment(commentId);
		if(commentMapper.countBundleComment(comment.getGroupId(), comment.getBundleId())>1) {			
			return commentMapper.updateDeleteComment(commentId);
		}
		else {
			return commentMapper.deleteComment(commentId);
		}
	}
	
	public int updateComment(Comment comment) {
		return commentMapper.updateComment(comment);
	}
}
