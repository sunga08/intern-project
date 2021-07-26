package com.wj.kstudy.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.wj.kstudy.dto.Book;
import com.wj.kstudy.service.BookService;
import com.wj.kstudy.service.KMoocAPIService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class BookController {
	
	@Autowired
	BookService bookService;
	
	
	//@Cacheable(key="#size", value="getBooks")
	@GetMapping("/book/{keyword}")
    public Object goBookPage(@PathVariable("keyword") String keyword) throws JsonProcessingException, UnsupportedEncodingException{
        return bookService.getNaverOpenApi(keyword);
    }
	
	@GetMapping("/book/count")
	public int count() {
		return bookService.getApiCall();
	}
	
}
