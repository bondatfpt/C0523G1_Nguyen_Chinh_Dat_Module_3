package com.example.ss10.service;

import com.example.ss10.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> showList();
    void save(Student student);
}
