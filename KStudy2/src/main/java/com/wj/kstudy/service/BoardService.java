package com.wj.kstudy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wj.kstudy.dto.Board;
import com.wj.kstudy.mapper.BoardMapper;


@Service
public class BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	public List<Board> getPostList(int groupId){
		return boardMapper.getPostList(groupId);
	}
	
	public int addPost(Board board) {
		return boardMapper.insertPost(board);
	}
	
	public int deletePost(int boardId) {
		return boardMapper.deletePost(boardId);
	}
	
	public int updateBoard(Board board) {
		return boardMapper.updatePost(board);
	}
	
	public Board getPost(int boardId) {
		return boardMapper.getPost(boardId);
	}
}
