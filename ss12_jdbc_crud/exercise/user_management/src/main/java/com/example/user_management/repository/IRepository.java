package com.example.user_management.repository;

import com.example.user_management.model.User;

import java.util.List;

public interface IRepository {
    List <User> getAll();
    void save (User user);
    void delete(int id);
    User getUserById (int id);
    void update(int id, String name, String email, String country);
    List<User> getUserByCountry(String country);
    List<User>  sortByName(List<User> userList);
}
