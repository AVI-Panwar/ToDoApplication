package com.example.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Pageable;
import com.example.DAO.ToDoDao;
import com.example.DTO.ToDo;

@Service
public class ToDoWebservice {

	@Autowired
	ToDoDao repo;

	public List<ToDo> getAllToDoItems() {
		ArrayList<ToDo> todoList = new ArrayList<>();
		repo.findAll().forEach(todo -> todoList.add(todo));

		return todoList;
	}

	public ToDo getToDoItemById(Long id) {
		return repo.findById(id).get();
	}

	public boolean updateStatus(Long id) {
		ToDo todo = getToDoItemById(id);
		todo.setStatus("Completed");

		return saveOrUpdateToDoItem(todo);
	}

	public boolean saveOrUpdateToDoItem(ToDo todo) {
		ToDo updatedObj = repo.save(todo);
		System.out.println("It has come here2222222");

		if (getToDoItemById(updatedObj.getId()) != null) {
			System.out.println("It has come here");
			return true;
		}
		return false;
	}

	public boolean deleteToDoItem(Long id) {
		repo.deleteById(id);

		if (repo.findById(id).isEmpty()) {
			return true;
		}

		return false;
	}

	public boolean validateUser(String name, String password) {
		// TODO Auto-generated method stub
		return name.equalsIgnoreCase("avipanwar") && password.equalsIgnoreCase("123avi");

	}

	/*
	 * public Page<ToDo> findPaginated(int pageNo, int pageSize) { Pageable pageable
	 * = PageRequest.of(pageNo-1, pageSize); return this.repo.findAll(pageable); }
	 */

	public Page<ToDo> getToDoList(Pageable pageable) {
		return repo.findAll(pageable);
	}
}
