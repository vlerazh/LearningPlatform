package com.example.demo.services;

import com.example.demo.model.Student;
import com.example.demo.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.*;

@Service
public class StudentServices implements IStudentService{

    @Autowired
    private StudentRepository studentRepository;


    @Override
    public List<Student> getAllStudents() {
        return this.studentRepository.findAll();
    }

    @Override
    public Student login(String email, String pass) {
       Optional<Student> studentOptional = this.studentRepository.findStudentByUsernameAndPassword(email,pass);

        return studentOptional.get();
    }

    @Override
    public Student add(Student student) {
        Student student1=this.studentRepository.save(student);
        return student1;
    }

}
