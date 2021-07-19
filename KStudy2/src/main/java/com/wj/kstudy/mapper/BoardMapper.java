package com.wj.kstudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.wj.kstudy.dto.Board;
import com.wj.kstudy.dto.Criteria;

@Mapper
public interface BoardMapper {
	public List<Board> getPostList(@Param("groupId") int groupId);
	public List<Board> getPostListPaging(@Param("groupId") int groupId, @Param("startPage") int startPage, @Param("recordsPerPage") int recordsPerPage);
	public List<Board> getPostListPaging2(Criteria criteria);
	public List<Board> getPostListTCPaging(Criteria criteria);
	public List<Board> getPostListWPaging(Criteria criteria);
	public Board getPost(int boardId);
	public int insertPost(Board board);
	public int deletePost(int boardId);
	public int updatePost(Board board);
	public int plusViewCnt(int boardId);
	public int getTotalTC(Criteria criteria);
	public int getTotalW(Criteria criteria);
}
