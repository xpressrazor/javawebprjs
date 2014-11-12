package change.packages.name.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import change.packages.name.domain.Game;
import change.packages.name.domain.User;
import change.packages.name.mvc.service.interfaces.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping
	public String list(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();		
		
		
		if(session.getAttribute("USERNAME") != null && session.getAttribute("USERNAME").equals("admin")) {
			model.addAttribute("userList", userService.findAll());
			return "user/list";
		} else {
			return "redirect:/user/login";
		}
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("user", new User());		

		return "user/add";
	}
	
	/* Game section */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("user") User user) {

		userService.create(user);

		return "redirect:/user/";
	}
	
	@RequestMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		User user = userService.findById(id);
		

		model.addAttribute("user", user);

		return "user/edit";
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public String edit(@PathVariable("id") Long id,
			@ModelAttribute("user") User user) {	

		userService.update(user);

		return "redirect:/user/";
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		userService.delete(id);

		return "redirect:/user/";
	}
	
	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("user", new User());		

		return "user/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpServletRequest request) {

		List<User> userList = userService.findAll();
		
		/* Sorry for doing this kind of programming */
		// TODO: Fix me
		boolean isUser = false;
		for(User tmpUser : userList) {
			if (user.getUsername().equals(tmpUser.getUsername()) && user.getPassword().equals(tmpUser.getPassword())) {
					isUser = true;
					break;
			}					
		}

		if(isUser) {
			HttpSession session = request.getSession();		    
		  session.setAttribute("USERNAME", user.getUsername());
			return "redirect:/media/";
		}
		else
			return "redirect:/user/login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("USERNAME");
		return "redirect:/user/login";
	}
}
