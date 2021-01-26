package com.example.demo.services;

import com.example.demo.model.LearningCourse;

import java.util.List;

public interface ILearningCourseService {
    List<LearningCourse> getCoursesByStudent(String studentId);
    List<LearningCourse> getAllCourses();
}
