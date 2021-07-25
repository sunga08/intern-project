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
	
	
	@Value("10") 
	private int PAGE_SIZE; //한 페이지에 나타나는 게시글 수
	
	
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
	
	public List<Board> getPostListPaging2(Criteria criteria){
		int totalCount = studyGroupMapper.getOneStudyGroup(criteria.getGroupId()).getPostCnt();
		criteria.setRecordsPerPage(PAGE_SIZE);
		criteria.setTotalData(totalCount);

		return boardMapper.getPostListPaging2(criteria);
	}
	
	public int addPost(Board board) {
		boardMapper.insertPost(board);
		return studyGroupMapper.plusPostCnt(board.getGroupId());
	}
	
	@Transactional
	public int deletePost(int boardId) {
		int result=0;
		
		Board board = boardMapper.getPost(boardId);
		int groupId = board.getGroupId();
		try {
			studyGroupMapper.minusPostCnt(groupId);
			result = boardMapper.deletePost(boardId);
		}catch(Exception e) {
			
		}
		return result;
	}
	
	public int updateBoard(Board board) {
		return boardMapper.updatePost(board);
	}
	
	public Board getPost(int boardId) {
		return boardMapper.getPost(boardId);
	}
	
	@Transactional
	public Board getPostAndPlusView(HttpServletRequest request, HttpServletResponse response, HttpSession session, int boardId) {
		//String userId = session.getAttribute("userId").toString();
		String nickname = session.getAttribute("nickname").toString();
		Board board = boardMapper.getPost(boardId);
		System.out.println(board.getViewCnt());
		
		Cookie[] cookies = request.getCookies();
		
		Cookie viewCookie = null;
		
		if(cookies != null && cookies.length>0) {
			for(int i=0; i<cookies.length;i++) {
				if(cookies[i].getName().equals("cookie"+nickname+"|"+boardId)) {
					System.out.println("처음 쿠키가 생성된 뒤 들어옴");
					viewCookie = cookies[i];
				}
			}
		}
		
		if(board!=null) {
			System.out.println("게시글 상세페이지");

			if(viewCookie==null) {
				System.out.println("쿠키 없음");
				Cookie newCookie = new Cookie("cookie"+nickname+"|"+boardId,"|"+nickname+"|"+boardId+"|");
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
	
	//제목+내용 검색 결과
	public List<Board> getSearchListPaging(Criteria criteria, int groupId, int option, String keyword, int page){
		int totalCount;
		List<Board> boardList = null;
		criteria.setRecordsPerPage(PAGE_SIZE);
		criteria.setGroupId(groupId);
		criteria.setCurrentPageNo(page);
		criteria.setKeyword(keyword);
		
		if(option==1) {
			totalCount = boardMapper.getTotalTC(criteria);
			criteria.setTotalData(totalCount);
			boardList = boardMapper.getPostListTCPaging(criteria);
		}
		
		else if(option==2) {
			totalCount = boardMapper.getTotalW(criteria);
			criteria.setTotalData(totalCount);
			boardList = boardMapper.getPostListWPaging(criteria);
		}
		
		return boardList;
		
	}
	
	//제목+내용 게시글 카운트
	public int getTotalTC(Criteria criteria, int groupId, String keyword) {
		criteria.setGroupId(groupId);
		criteria.setKeyword(keyword);
		
		return boardMapper.getTotalTC(criteria);
	}
	
	
	//제목+내용 검색 결과
	public List<Board> getPostListWPaging(Criteria criteria, int groupId, String keyword, int page){
		int totalCount = boardMapper.getTotalW(criteria);
		criteria.setRecordsPerPage(PAGE_SIZE);
		criteria.setTotalData(totalCount);
		criteria.setGroupId(groupId);
		criteria.setCurrentPageNo(page);
		criteria.setKeyword(keyword);
		
		return boardMapper.getPostListWPaging(criteria);
	}
	
	//제목+내용 게시글 카운트
	public int getTotalW(Criteria criteria, int groupId, String keyword) {
		criteria.setGroupId(groupId);
		criteria.setKeyword(keyword);
		
		return boardMapper.getTotalW(criteria);
	}
	
	
}
