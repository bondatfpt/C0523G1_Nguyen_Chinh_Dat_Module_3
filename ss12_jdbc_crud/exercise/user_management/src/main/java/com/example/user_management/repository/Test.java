package com.example.user_management.repository;

import com.example.user_management.model.User;

import java.util.ArrayList;
import java.util.List;

public class Test {
    private static IRepository repository = new Repository();
    public static void main(String[] args) {
        User user1 = new User("Dat");
        User user2 = new User("No");
        User user3 = new User("Cau");
        User user4 = new User("Mac");
        User user5 = new User("An");
        List<User> userList= new ArrayList<>();
        userList.add(user1);
        userList.add(user2);
        userList.add(user3);
        userList.add(user4);
        userList.add(user5);
        userList = repository.sortByName(userList);
        System.out.println(userList);

    }
}
