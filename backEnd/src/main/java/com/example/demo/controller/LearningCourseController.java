package com.example.demo.controller;

import com.example.demo.model.LearningCourse;
import com.example.demo.model.Student;
import com.example.demo.services.ILearningCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/course")
public class LearningCourseController {

    @Autowired
    private ILearningCourseService learningCourseService;

    @GetMapping()
    public ResponseEntity getAllCourses() {
        List<LearningCourse> courseList = this.learningCourseService.getAllCourses();
        return ResponseEntity.ok(courseList);
    }

    @PostMapping("/getCourseByStudent/{id}")
    public ResponseEntity getCoursesByStudent(String id){
        List<LearningCourse> courseList = this.learningCourseService.getCoursesByStudent(id);
        return ResponseEntity.ok(courseList);
    }
}
