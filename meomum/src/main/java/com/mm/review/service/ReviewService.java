package com.mm.review.service;


import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.mm.review.model.ReviewDTO;

public interface ReviewService {
	
	public int reviewInsert(ReviewDTO dto);
	public JsonObject SummerNoteImageFile(MultipartFile file);

}
