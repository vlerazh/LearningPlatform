package com.example.demo.controller;

import com.example.demo.helpers.LoginHelper;
import com.example.demo.model.Student;
import com.example.demo.repository.StudentRepository;
import com.example.demo.services.StudentServices;
import com.example.demo.services.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/student")
public class StudentController {

    @Autowired
    private IStudentService studentService;

    @GetMapping()
    public ResponseEntity getAllStudents() {
        List<Student> studentList = this.studentService.getAllStudents();
        return ResponseEntity.ok(studentList);
    }

    @PostMapping("/login")
    public ResponseEntity login(@RequestBody LoginHelper login) {
        Student student = this.studentService.login(login.getUsername(), login.getPassword());

        if (student == null) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(student);
    }

    @PostMapping("/add")
    public void addStudent(@RequestBody Student student) {

        Student student1 = this.studentService.add(student);
    }


}
