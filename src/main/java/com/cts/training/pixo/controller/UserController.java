package com.cts.training.pixo.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cts.training.pixo.model.Media;
import com.cts.training.pixo.model.User;
import com.cts.training.pixo.repository.MediaRepository;
import com.cts.training.pixo.repository.UserRepository;


@Controller
public class UserController {
	
@Autowired
private UserRepository userRepository;

@Autowired 
private MediaRepository mediaRepository;

@RequestMapping("/")    
public String init(Model m){    
       return "login";  
       
}

@RequestMapping("/save")
public ModelAndView save(@ModelAttribute("reg") User form,BindingResult result) throws IOException {
	
	
	userRepository.AddUser(form);
	return new ModelAndView("login");
   
}

@RequestMapping("/sample")    
public String init1(Model m){    
       return "test";  
       
}



@RequestMapping(value="/check")       
public ModelAndView Login(@ModelAttribute("log") User form,BindingResult result)
{
	
	User u=userRepository.getUserByEmail(form.getEmail(),form.getPassword());
	 
	 if(u!=null){
		 System.out.print(u);
		ModelAndView mv=new ModelAndView("uploadmedia", "res_list", u);
		mv.addObject("username",u.getUsername());
	   // mv.addObject("userId",u.getUserId());
		  return mv ;
	 }
	 return new ModelAndView("login");
	 
	 
}


@RequestMapping(value="/media/{uid}")
public ModelAndView multiple(@PathVariable int uid)
{
	User u = userRepository.getUserByUserId(uid);
	System.out.println(u);
	return new ModelAndView("uploadmedia","res_list",u);
}

@RequestMapping(value="/display/{uid}")
public ModelAndView multiple1(@PathVariable int uid)
{
	User u = userRepository.getUserByUserId(uid);
	List<Media> lm= mediaRepository.getAllImages();
	 ModelAndView mv=new ModelAndView("display","listOfImages",lm);
	 mv.addObject(uid);
	 return mv;
}

@RequestMapping(value="/follower/{uid}")
public ModelAndView multiple2(@PathVariable int uid)
{
	List<User> u = userRepository.getAllExcept(uid);
	
	return new ModelAndView("follower","list",u);
}


@RequestMapping(value="/test1/{userId}")
public ModelAndView test(@PathVariable int userId, @ModelAttribute("form") Media form, BindingResult result)
{
	
	System.out.println("controller");
	User u = userRepository.getUserByUserId(userId);
	System.out.println(u.getUsername());
	form.setUser(u);
	System.out.println(form.getDescription());
	System.out.println(form.getPhoto_loc());
	mediaRepository.addMedia(form);
	//service.deleteUser(2);
	List<Media> lm= mediaRepository.getAllImages();
	//System.out.println(lm);
	return new ModelAndView("display","listOfImages",lm);
	//return new ModelAndView("test");
}


@RequestMapping(value="followperson/{uid}/{fid}")       
public ModelAndView Follow( @PathVariable int uid,@PathVariable int fid)
{
	
	 

	 System.out.println(uid);
	 System.out.println(fid);
	 User u=userRepository.getUserByUserId(uid);
	 User x=userRepository.getUserByUserId(fid);

	 List<User> lu1 = new ArrayList<>();
	 lu1.add(x);

	
	 u.setFollowof(lu1);
	 userRepository.FollowUser(u);
	 return new ModelAndView("test");
	 
}


}
