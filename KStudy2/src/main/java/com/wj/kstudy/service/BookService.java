package com.wj.kstudy.service;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;

@Service
public class BookService {
	private final String CLIENT_ID = "GOVPZceHHvHKv7Raru8F";
	private final String CLIENT_SECRET = "DBeRtQGo_H";
	
	private final String url = "https://openapi.naver.com/v1/search/book";
	private static int apiCall=0;
	
	public Object getNaverOpenApi(String keyword) throws JsonProcessingException, UnsupportedEncodingException{
		
		apiCall++;
		
		RestTemplate restTemplate = new RestTemplate();

		
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("plain", "text", Charset.forName("UTF-8")));
        headers.set("X-Naver-Client-Id", CLIENT_ID);
        headers.set("X-Naver-Client-Secret", CLIENT_SECRET);
        //String encodeKeyword = URLEncoder.encode(keyword,"UTF-8");
        
        UriComponents builder = UriComponentsBuilder.fromHttpUrl(url).queryParam("query", keyword).queryParam("display",10).build(false);
        
        //System.out.println(builder.toString());
        
        final HttpEntity<String> entity = new HttpEntity<>(headers);
        
        //System.out.println(entity.getHeaders());
        
        Object response = restTemplate.exchange(builder.toUriString(), HttpMethod.GET, entity, String.class).getBody();

        //System.out.println(response.toString());
		
        return response;
    
	}
	
	public static int getApiCall() {
		return apiCall;
	}
}
