package com.example.ss10.service;

import com.example.ss10.model.Student;
import com.example.ss10.repository.IStudentRepository;
import com.example.ss10.repository.StudentRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentService implements IStudentService{
    private IStudentRepository iStudentRepository = new StudentRepository();
    @Override
    public List<Student> showList() {
        return iStudentRepository.showList();
    }

    @Override
    public void save(Student student) {
        iStudentRepository.save(student);
    }


}
