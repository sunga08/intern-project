import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.Charset;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class RestTemplateTestApplication {
	public static void main(String[] args) throws UnsupportedEncodingException {

	      String url = "http://apis.data.go.kr/B552881/kmooc/courseList";
	      String serviceKey = "G/FFoti9HWJT1rtBvhjUZDwukmcVbtpk/lwPnDLf0rqbaTs00NUsiFPJcs9flEUseYx8pY0yCoxpPdL9gCPFRw==";
	      String decodeServiceKey = URLDecoder.decode(serviceKey, "UTF-8");
	      //System.out.println(decodeServiceKey);
	      
	      RestTemplate restTemplate = new RestTemplate();
	      HttpHeaders httpheaders = new HttpHeaders();
	      //httpheaders.set("Authorization","Bearer 키");

	      httpheaders.setContentType(new MediaType("application","json",Charset.forName("UTF-8")));
	      
	      UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
	    		  .queryParam("ServiceKey", decodeServiceKey)
	    		  .queryParam("Page",1).build(false);

	      HttpEntity<String> entity = new HttpEntity<>(httpheaders);
	      String str = restTemplate.exchange(builder.toUriString(), HttpMethod.GET,entity,String.class).getBody();
	      System.out.println(str);
	   }

}
