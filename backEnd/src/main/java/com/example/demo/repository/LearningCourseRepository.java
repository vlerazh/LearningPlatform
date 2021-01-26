package com.example.demo.repository;

import com.example.demo.model.LearningCourse;

import com.example.demo.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LearningCourseRepository extends JpaRepository<LearningCourse,String> {

}
