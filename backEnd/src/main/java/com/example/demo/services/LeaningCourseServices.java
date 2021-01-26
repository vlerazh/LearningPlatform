package com.example.demo.services;

import com.example.demo.model.LearningCourse;
import com.example.demo.repository.LearningCourseRepository;
import jdk.nashorn.internal.runtime.options.Option;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;
import java.util.Optional;

@Service
public class LeaningCourseServices implements ILearningCourseService{

    @Autowired
    private LearningCourseRepository learningCourseRepository;

    @Override
    public List<LearningCourse> getCoursesByStudent(String studentId) {

        return null;
    }

    @Override
    public List<LearningCourse> getAllCourses() {
        String s = "";
        return this.learningCourseRepository.findAll();
    }
}
