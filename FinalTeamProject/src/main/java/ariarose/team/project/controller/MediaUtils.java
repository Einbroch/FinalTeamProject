package ariarose.team.project.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
	private static Map<String, MediaType> mediaMap;
	
	static{
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	/*
		업로드된 파일이 사진일 경우에만 저장할 수 있도록 하는 function
	 */
	public static MediaType getMediaType(String type){
		return mediaMap.get(type.toUpperCase());
	}
}
