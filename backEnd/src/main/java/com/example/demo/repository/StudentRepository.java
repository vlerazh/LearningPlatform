package com.example.demo.repository;

import com.example.demo.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StudentRepository extends JpaRepository<Student,String> {
    @Query("select s from Student s where s.email=?1 and s.password=?2")
    Optional<Student> findStudentByUsernameAndPassword(String email, String pass);

}
