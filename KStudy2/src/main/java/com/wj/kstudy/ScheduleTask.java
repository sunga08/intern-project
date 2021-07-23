package com.wj.kstudy;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wj.kstudy.dto.Lecture;
import com.wj.kstudy.mapper.LectureMapper;

@Component
public class ScheduleTask {
	@Autowired
	LectureMapper lectureMapper;
	
	
//	@Scheduled(cron="0 0 21 * * *")
//	private void scheduleTest() {
//		System.out.println("test");
//	}
	
	public int getCnt() throws UnsupportedEncodingException, JsonProcessingException {
		
		HashMap<String, Object> result = new HashMap<String,Object>();
		String jsonString="";
		
		
		String url = "http://apis.data.go.kr/B552881/kmooc/courseList";
		String serviceKey = "G/FFoti9HWJT1rtBvhjUZDwukmcVbtpk/lwPnDLf0rqbaTs00NUsiFPJcs9flEUseYx8pY0yCoxpPdL9gCPFRw==";
		String decodeServiceKey = URLDecoder.decode(serviceKey, "UTF-8");
		// System.out.println(decodeServiceKey);

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders httpheaders = new HttpHeaders();

		httpheaders.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));

		UriComponents builder = UriComponentsBuilder.fromHttpUrl(url).queryParam("ServiceKey", decodeServiceKey)
				.queryParam("page", 1).build(false);

		HttpEntity<String> entity = new HttpEntity<>(httpheaders);
		
		//API를 호출해 MAP타입으로 전달 받음
		ResponseEntity<Map> response = restTemplate.exchange(builder.toUriString(), HttpMethod.GET, entity, Map.class);
		result.put("statudsCode", response.getStatusCode());
		result.put("header", response.getHeaders());
		result.put("body", response.getBody());
		
		ObjectMapper mapper = new ObjectMapper();
		jsonString = mapper.writeValueAsString(response.getBody());
		
		
		LinkedHashMap lm = (LinkedHashMap)response.getBody().get("pagination");
		
		int totalPage = (int)lm.get("num_pages");
		System.out.println("num_pages:"+ totalPage);
		
        //Object response = restTemplate.exchange(builder.toUriString(), HttpMethod.GET, new HttpEntity<String>(headers), String.class);
        return totalPage;
	}
	
	@Scheduled(cron="0 15 21 * * *")
	private void updateLectureDB() throws JsonProcessingException, UnsupportedEncodingException {
		int total = getCnt();
		System.out.println(total);
		
		HashMap<String, Object> result = new HashMap<String,Object>();
		String jsonString="";
		
		
		String url = "http://apis.data.go.kr/B552881/kmooc/courseList";
		String serviceKey = "G%2FFFoti9HWJT1rtBvhjUZDwukmcVbtpk%2FlwPnDLf0rqbaTs00NUsiFPJcs9flEUseYx8pY0yCoxpPdL9gCPFRw%3D%3D";
		String decodeServiceKey = URLDecoder.decode(serviceKey, "UTF-8");

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders httpheaders = new HttpHeaders();
		
		httpheaders.setContentType(new MediaType("application", "json", Charset.forName("UTF-8")));
		

		for(int i=1; i<=total; i++) {
			try {
				System.out.println(i);
				//getItemsFromOpenApi2(i);	
				

				if (i % 15 == 0) {
					try {
						restTemplate = new RestTemplate();
						Thread.sleep(60000); //1분 지연시키기
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
				UriComponents builder = UriComponentsBuilder.fromHttpUrl(url).queryParam("ServiceKey", decodeServiceKey)
						.queryParam("page", i).build(false);

				System.out.println(builder.toString());
				
				HttpEntity<String> entity = new HttpEntity<>(httpheaders);
				
				//API를 호출해 MAP타입으로 전달 받음
				ResponseEntity<Map> response = restTemplate.exchange(builder.toUriString(), HttpMethod.GET, entity, Map.class);
				result.put("statudsCode", response.getStatusCode());
				result.put("header", response.getHeaders());
				result.put("body", response.getBody());

				
				ArrayList<Map> lecList = (ArrayList<Map>) response.getBody().get("results");
						
				LinkedHashMap mnList = new LinkedHashMap<>();
				
				
				if(lecList==null) continue;
				int tmp = 0;
				for(Map obj:lecList) {
					Lecture lecture = new Lecture();
					
					lecture.setBlocksUrl(obj.get("blocks_url").toString());
					lecture.setLecId(obj.get("course_id").toString());
					lecture.setLecUrl("http://www.kmooc.kr/courses/"+obj.get("course_id").toString()+"/about");
					lecture.setLecName(obj.get("name").toString());
					
					if(obj.get("classfy_name")!=null)
						lecture.setClassfy(obj.get("classfy_name").toString());
					else
						lecture.setClassfy("");
					
					if(obj.get("middle_classfy_name")!=null)
						lecture.setMidClassfy(obj.get("middle_classfy_name").toString());
					else
						lecture.setMidClassfy("");
					
					lecture.setTeachers(obj.get("teachers").toString());
					lecture.setOrgName(obj.get("org_name").toString());
					lecture.setEnrollStart(obj.get("enrollment_start").toString());
					lecture.setEnrollEnd(obj.get("enrollment_end").toString());
					lecture.setAuditYn(obj.get("audit_yn").toString());
					LinkedHashMap lm2 = (LinkedHashMap)obj.get("media");
					LinkedHashMap lm3 = (LinkedHashMap)lm2.get("image");
					lecture.setImage(lm3.get("small").toString());
					lecture.setShortDsc(obj.get("short_description").toString());
					lecture.setHidden(obj.get("hidden").toString());
					
					if(obj.get("language_name")!=null)
						lecture.setLanguageName(obj.get("language_name").toString());
					else 
						lecture.setLanguageName("");
					
					lectureMapper.insertOrUpdateLecture(lecture);
					tmp++;
					System.out.println("("+tmp+") OK");
//					System.out.println(lecture.toString());
					
				}
				

			} catch (Exception e) {
				System.out.println("("+i+") FAIL");
				e.printStackTrace();
			}
		}
	}
}
