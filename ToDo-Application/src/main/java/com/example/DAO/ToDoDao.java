package com.example.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.DTO.ToDo;


@Repository 
public interface ToDoDao  extends JpaRepository <ToDo, Long>{

}
