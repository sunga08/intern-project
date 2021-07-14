package com.wj.kstudy.service;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wj.kstudy.dto.Board;
import com.wj.kstudy.dto.Criteria;
import com.wj.kstudy.mapper.BoardMapper;
import com.wj.kstudy.mapper.StudyGroupMapper;



@Service
public class BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	StudyGroupMapper studyGroupMapper;
	
	
	@Value("5")
	private int PAGE_SIZE;
	
	
	public List<Board> getPostList(int groupId){

		return boardMapper.getPostList(groupId);
	}
	
	public List<Board> getPostListPaging(int groupId, Criteria criteria){
		int totalCount = studyGroupMapper.getOneStudyGroup(groupId).getPostCnt();
		criteria.setRecordsPerPage(5);
		criteria.setTotalData(totalCount);
		
		
		List<Board> postList = Collections.emptyList();
		int startPage = criteria.getStartPage(); //offset

		
		if(totalCount>0) {
			postList = boardMapper.getPostListPaging(groupId, startPage, PAGE_SIZE);
		}
		return postList;
	}
	
	public int addPost(Board board) {
		boardMapper.insertPost(board);
		return studyGroupMapper.plusPostCnt(board.getGroupId());
	}
	
	public int deletePost(int boardId) {
		Board board = boardMapper.getPost(boardId);
		int groupId = board.getGroupId();
		boardMapper.deletePost(boardId);
		return studyGroupMapper.minusPostCnt(groupId);
	}
	
	public int updateBoard(Board board) {
		return boardMapper.updatePost(board);
	}
	
	public Board getPost(int boardId) {
		return boardMapper.getPost(boardId);
	}
	
	@Transactional
	public Board getPostAndPlusView(HttpServletRequest request, HttpServletResponse response, HttpSession session, int boardId) {
		String userId = session.getAttribute("user_id").toString();
		Board board = boardMapper.getPost(boardId);
		System.out.println(board.getViewCnt());
		
		Cookie[] cookies = request.getCookies();
		
		Cookie viewCookie = null;
		
		if(cookies != null && cookies.length>0) {
			for(int i=0; i<cookies.length;i++) {
				if(cookies[i].getName().equals("cookie"+userId+"|"+boardId)) {
					System.out.println("처음 쿠키가 생성된 뒤 들어옴");
					viewCookie = cookies[i];
				}
			}
		}
		
		if(board!=null) {
			System.out.println("게시글 상세페이지");

			if(viewCookie==null) {
				System.out.println("쿠키 없음");
				Cookie newCookie = new Cookie("cookie"+userId+"|"+boardId,"|"+userId+"|"+boardId+"|");
				//newCookie.setMaxAge(5);
				response.addCookie(newCookie);
				int result = boardMapper.plusViewCnt(boardId);
				board = boardMapper.getPost(boardId); 
				if(result>0) {
					System.out.println("조회수 증가");
				}
				else {
					System.out.println("조회수 증가 에러");
				}
			}
			else {
				System.out.println("쿠키 있음");
				
				String value = viewCookie.getValue();
				System.out.println("쿠키값:"+value);
			}
			
			
		}
		
		
		return board;
	}
}
