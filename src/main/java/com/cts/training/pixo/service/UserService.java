package com.cts.training.pixo.service;

import java.util.List;

import com.cts.training.pixo.model.Media;
import com.cts.training.pixo.model.User;

public interface UserService {
	List<User> getAllUsers();
User getUserByUserId(Integer id);
User AddUser(User u);
User getUserByEmail(String Email, String password);
Media AddMedia(Media m);
User DeleteUserById(Integer id);

}
