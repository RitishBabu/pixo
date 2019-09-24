package com.cts.training.pixo.service;

import java.util.List;

import com.cts.training.pixo.model.Media;


public interface MediaService {
	Media addMedia(Media m);
	List<Media> getAllImages();
	List<Media> getAllImagesById(int id);
	
}
