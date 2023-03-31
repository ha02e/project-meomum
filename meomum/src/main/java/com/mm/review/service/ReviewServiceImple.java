package com.mm.review.service;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.mm.review.model.ReviewDAO;
import com.mm.review.model.ReviewDTO;

public class ReviewServiceImple implements ReviewService {

	private ReviewDAO reviewDao;
	
	public ReviewServiceImple(ReviewDAO reviewDao) {
		super();
		this.reviewDao = reviewDao;
	}

	@Override
	public int reviewInsert(ReviewDTO dto) {
		int count=reviewDao.reviewInsert(dto);
		return count;
	}
	
	@Override
	public JsonObject SummerNoteImageFile(MultipartFile file) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "C:\\summernoteImg\\";
		String originalFileName = file.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String saveFileName = UUID.randomUUID()+extension;
			
		File targetFile = new File(fileRoot+saveFileName);
		
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", "/summernoteImg/"+saveFileName);
			jsonObject.addProperty("responseCode", "succcess");
		} catch(IOException e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}	
		return jsonObject;

	}

}
