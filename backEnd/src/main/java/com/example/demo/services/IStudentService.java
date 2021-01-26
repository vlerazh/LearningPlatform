package com.example.demo.services;

import com.example.demo.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> getAllStudents();
    Student login(String username, String pass);

    Student add(Student employee);


}
