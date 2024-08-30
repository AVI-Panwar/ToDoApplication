package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.DTO.ToDo;
import com.example.service.ToDoWebservice;

@Controller
public class ToDoController {

	@Autowired
	private ToDoWebservice service;

	
	 @GetMapping({ "/viewToDoList" }) public String viewAllToDoItems(Model
	  model, @ModelAttribute("message") String message) {
	  model.addAttribute("list", service.getAllToDoItems());
	  
	  model.addAttribute("message", message);
	  
	  return "ViewToDoList";
	  
	//  return findPaginated(1, model);
	  
	 }
	 

	/*
	 * @GetMapping("/viewToDoList") public String
	 * viewAllToDoItems(@RequestParam(defaultValue = "0") int page, Model model,
	 * 
	 * @ModelAttribute("message") String message) { PageRequest pageable =
	 * PageRequest.of(page, 5); // Fetching only 5 items per page Page<ToDo>
	 * todoPage = service.getToDoList(pageable);
	 * 
	 * model.addAttribute("todoList", todoPage.getContent());
	 * model.addAttribute("message", message); model.addAttribute("currentPage",
	 * page); model.addAttribute("totalPages", todoPage.getTotalPages());
	 * 
	 * return "ViewToDoList"; // Returning the view name }
	 */

	@GetMapping({ "/login" })
	public String login() {

		return "login";

	}

	@GetMapping({ "/about" })
	public String about() {

		return "about";

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String showHomePage(ModelMap model, @RequestParam String name, @RequestParam String password) {
		boolean isValidUser = service.validateUser(name, password);

		System.out.println("Values : " + name);

		if (!isValidUser) {
			model.put("errorMessage", "Access Denied , Invalid Credentials");
			return "login";
		}

		model.put("name", name);
		model.put("password", password);

		return "redirect:/viewToDoList";

	}

	@GetMapping("/updateToDoStatus/{id}")
	public String updateToDoStatus(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		if (service.updateStatus(id)) {
			redirectAttributes.addFlashAttribute("message", "Update Success");
			return "redirect:/viewToDoList";
		}

		redirectAttributes.addFlashAttribute("message", "Update Failure");
		return "redirect:/viewToDoList";
	}

	@GetMapping("/addToDoItem")
	public String addToDoItem(Model model) {
		model.addAttribute("todo", new ToDo());

		return "AddToDoItem";
	}

	@PostMapping("/saveToDoItem")
	public String saveToDoItem(ToDo todo, RedirectAttributes redirectAttributes) {

		System.out.println("Hello ");

		if (service.saveOrUpdateToDoItem(todo)) {
			redirectAttributes.addFlashAttribute("message", "Save Success");
			return "redirect:/viewToDoList";
		}

		redirectAttributes.addFlashAttribute("message", "Save Failure");
		return "redirect:/addToDoItem";
	}

	/*
	 * @GetMapping("/editToDoItem/{id}") public String editToDoItem(@PathVariable
	 * Long id, Model model) { model.addAttribute("todo",
	 * service.getToDoItemById(id));
	 * 
	 * return "EditToDoItem"; }
	 */

	@PostMapping("/editToDoItem")
	public String editToDoItem(@ModelAttribute EditRequest editRequest, Model model) {
		System.out.println("The id" + editRequest.getNumber());
		model.addAttribute("todo", service.getToDoItemById(Long.parseLong(editRequest.getNumber())));
		return "EditToDoItem";
	}

	@PostMapping("/editSaveToDoItems")
	public String editSaveToDoItem(ToDo todo, RedirectAttributes redirectAttributes) {
		if (service.saveOrUpdateToDoItem(todo)) {
			redirectAttributes.addFlashAttribute("message", "Edit Success");
			return "redirect:/viewToDoList";

		}

		redirectAttributes.addFlashAttribute("message", "Edit Failure");
		return "redirect:/editToDoItem/" + todo.getId();
	}

	@GetMapping("/deleteToDoItem/{id}")
	public String deleteToDoItem(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		if (service.deleteToDoItem(id)) {
			redirectAttributes.addFlashAttribute("message", "Delete Success");
			return "redirect:/viewToDoList";
		}

		redirectAttributes.addFlashAttribute("message", "Delete Failure");
		return "redirect:/viewToDoList";

	}

	/*
	 * @GetMapping ("/page/{pageNo}") public String findPaginated(@PathVariable
	 * (value="pageNo") int pageNo, Model model) { int pageSize=5; Page<ToDo>
	 * page=service.findPaginated(pageNo, pageSize); List<ToDo>
	 * todo=page.getContent();
	 * 
	 * model.addAttribute("currentPage", pageNo); model.addAttribute("totalPages",
	 * page.getTotalPages()); model.addAttribute("totalItems",
	 * page.getTotalElements()); model.addAttribute("todo", todo);
	 * 
	 * return "ViewToDoList"; }
	 */

	/*
	 * @GetMapping("/entities") public String
	 * getEntitiesPage(@RequestParam(defaultValue = "0") int page,
	 * 
	 * @RequestParam(defaultValue = "10") int size, Model model) { PageRequest
	 * pageable = PageRequest.of(page, size); Page<YourEntity> entities =
	 * yourEntityService.findAll(pageable);
	 * 
	 * model.addAttribute("entities", entities.getContent());
	 * model.addAttribute("currentPage", page); model.addAttribute("totalPages",
	 * entities.getTotalPages());
	 * 
	 * return "entities"; }
	 * 
	 * 
	 * 
	 */

	/*
	 * public Page<ToDo> getToDoList(Pageable pageable) { return
	 * service.findAll(pageable); }
	 */

	/*
	 * @GetMapping("/viewToDoList") public String
	 * getToDoList(@RequestParam(defaultValue = "0") int
	 * page, @RequestParam(defaultValue = "5") int size, Model model) { PageRequest
	 * pageable = PageRequest.of(page, size); Page<ToDo> todoPage =
	 * service.getToDoList(pageable);
	 * 
	 * model.addAttribute("todoList", todoPage.getContent());
	 * model.addAttribute("currentPage", page); model.addAttribute("totalPages",
	 * todoPage.getTotalPages());
	 * 
	 * return "viewToDoList"; }
	 */
}
