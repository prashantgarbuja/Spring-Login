package org.gtech.service;

import org.gtech.model.User;

public interface UserService {
	public User findUserByEmail(String email);
	public User findUserByName(String name);
	public User findUserById(Integer id);
	public void saveUser(User user,String role);
	public void saveUserAndPassword(User user,String password);
	public void saveUser(User user);
}
