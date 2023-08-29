package com.example.ss10.repository;

import com.example.ss10.model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> showList();
    void save(Student student);
}
