package com.wj.kstudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wj.kstudy.dto.Board;

@Mapper
public interface BoardMapper {
	public List<Board> getPostList(int groupId);
	public Board getPost(int boardId);
	public int insertPost(Board board);
	public int deletePost(int boardId);
	public int updatePost(Board board);
}
