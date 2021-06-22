package com.wj.kstudy.service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class KMoocListService {
	public Object getItemsFromOpenApi(int Page) throws UnsupportedEncodingException {
		String url = "http://apis.data.go.kr/B552881/kmooc/courseList";
		String serviceKey = "G/FFoti9HWJT1rtBvhjUZDwukmcVbtpk/lwPnDLf0rqbaTs00NUsiFPJcs9flEUseYx8pY0yCoxpPdL9gCPFRw==";
		String decodeServiceKey = URLDecoder.decode(serviceKey, "UTF-8");
		// System.out.println(decodeServiceKey);

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders httpheaders = new HttpHeaders();
		// httpheaders.set("Authorization","Bearer 키");

		httpheaders.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));

		UriComponents builder = UriComponentsBuilder.fromHttpUrl(url).queryParam("ServiceKey", decodeServiceKey)
				.queryParam("page", Page).build(false);

		HttpEntity<String> entity = new HttpEntity<>(httpheaders);
		Object response = restTemplate.exchange(builder.toUriString(), HttpMethod.GET, entity, String.class).getBody();
		System.out.println(builder.toString());      
        //Object response = restTemplate.exchange(builder.toUriString(), HttpMethod.GET, new HttpEntity<String>(headers), String.class);
        return response;
	}
}
