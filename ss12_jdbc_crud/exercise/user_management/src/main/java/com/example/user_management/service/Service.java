package com.example.user_management.service;

import com.example.user_management.model.User;
import com.example.user_management.repository.IRepository;
import com.example.user_management.repository.Repository;

import java.util.ArrayList;
import java.util.List;

public class Service implements IService{
    IRepository iRepository = new Repository();
    @Override
    public List<User> getAll() {
        List<User> userList = iRepository.getAll();
        return userList;
    }

    @Override
    public void save(User user) {
        iRepository.save(user);
    }

    @Override
    public void delete(int id) {
        iRepository.delete(id);
    }

    @Override
    public User getUserById(int id) {
        return iRepository.getUserById(id);
    }

    @Override
    public void update(int id ,String name, String email, String country) {
            iRepository.update(id,name,email,country);
    }

    @Override
    public List<User> getUserByCountry(String country) {
        List<User> userList = iRepository.getUserByCountry(country);
        return userList;
    }
}
