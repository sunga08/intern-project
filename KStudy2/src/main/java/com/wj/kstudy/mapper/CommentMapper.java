package com.wj.kstudy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.wj.kstudy.dto.Comment;

@Mapper
public interface CommentMapper {
	public List<Comment> getComments(@Param("groupId") int groupId, @Param("boardId") int boardId);
	public Comment getOneComment(int commentId);
	public int insertComment(Comment comment);
	public int countBundleComment(@Param("groupId") int groupId, @Param("bundleId") int bundleId);
	public int countBundle(int groupId);
	public int countReplyUseY(@Param("groupId") int groupId, @Param("bundleId") int bundleId);
	public int deleteComment(int commentId);
	public int updateDeleteComment(int commentId);
	public int updateComment(Comment comment);
}
