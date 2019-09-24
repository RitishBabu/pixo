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
import com.cts.training.pixo.model.User;
import com.cts.training.pixo.model.follow;
import com.cts.training.pixo.service.UserService;
@Repository
public class UserRepository implements UserService  {

	@Autowired
	private EntityManager manager;

	@Override
	public List<User> getAllUsers() {

		Query q=manager.createQuery("from User");
	
		return q.getResultList();

	}
	
	public List<User> getAllExcept(Integer id)
	{
		Query q=manager.createQuery("from User u where u.userId!=:arg1");
		q.setParameter("arg1", id);
		
		return q.getResultList();
		
	}
	
	public List<follow> getAll(Integer id)
	{
		Query q=manager.createQuery("from follow f where f.user_id=:arg1");
		q.setParameter("arg1", id);
		
		return q.getResultList();
		
	}
	

	@Override
	public User getUserByUserId(Integer id) {
		// TODO Auto-generated method stub
		return manager.find(User.class,id);
	}

	@Override
	@Transactional
	public User AddUser(User u) {
		
		File file = new File(u.getPhoto_loc());
		System.out.println(file);
		System.out.println(u.getPhoto_loc());
	     byte[] bFile = new byte[(int) file.length()];
	     System.out.println("In dao");
System.out.println(bFile);
		
		 try { FileInputStream fileInputStream = new FileInputStream(file);
		 fileInputStream.read(bFile); fileInputStream.close(); } catch (Exception e) {
		  e.printStackTrace(); }
		 


	     u.setPhoto(bFile);
		return manager.merge(u);
		
		
	}

	@Override
	public User getUserByEmail(String Email, String password) {
		Query query =  manager.createQuery("select u from User u where u.email=:email");
		query.setParameter("email", Email);
		int i=query.getMaxResults();
		User u = (User) query.getSingleResult();
		 if(u.getEmail().equals(Email)&&u.getPassword().equals(password)) {
			 System.out.println("vdxc");
			 return u;
			 
		 }
		 else
		return null;
	}

	@Override
	public User DeleteUserById(Integer id) {
		// TODO Auto-generated method stub
		User u = manager.find(User.class, id);
		manager.remove(u);
		return u;
	}

	@Override
	public Media AddMedia(Media m) {
		// TODO Auto-generated method stub
		return manager.merge(m);
	}
	@Transactional
	public User FollowUser(User u) {
		 
		return manager.merge(u);
		
	}

}
