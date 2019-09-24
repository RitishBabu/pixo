package com.cts.training.pixo.repository;


import java.io.File;
import java.io.FileInputStream;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cts.training.pixo.model.Media;
import com.cts.training.pixo.service.MediaService;

@Repository
public class MediaRepository implements MediaService {

	
	@Autowired
	private EntityManager manager;

	

	@Override
	@Transactional
	public Media addMedia(Media m) {
		File file = new File(m.getPhoto_loc());
		System.out.println(file);
		System.out.println(m.getPhoto_loc());
	     byte[] bFile = new byte[(int) file.length()];
	     System.out.println("In dao");
System.out.println(bFile);
		
		 try 
		 { 
		FileInputStream fileInputStream = new FileInputStream(file);
		 fileInputStream.read(bFile); fileInputStream.close();
		 }
		 catch (Exception e) {
		 e.printStackTrace(); }
		 
		 m.setPhoto(bFile);
		 System.out.println("dsfdsf");
		return manager.merge(m);
	}

	@Override
	public List<Media> getAllImages() {
		// TODO Auto-generated method stub
		Query q = manager.createQuery("from Media");
		 return q.getResultList();
	}

	@Override
	public List<Media> getAllImagesById(int uid) {
		// TODO Auto-generated method stub
		Query q = manager.createQuery("from Media m where m.id=:arg1 ");
		q.setParameter("arg1", uid);
		 return q.getResultList();
	}
}
