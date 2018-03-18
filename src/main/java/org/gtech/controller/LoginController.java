package org.gtech.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.gtech.model.Channel;
import org.gtech.model.Message;
import org.gtech.model.User;
import org.gtech.repository.ChannelRepository;
import org.gtech.repository.MessageRepository;
import org.gtech.repository.UserRepository;
import org.gtech.service.ChannelService;
import org.gtech.service.MessageService;
import org.gtech.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ChannelService channelService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ChannelRepository channelRepository;
	
	@Autowired
	private MessageRepository messageRepository;

	@RequestMapping(value={"/", "/login"}, method = RequestMethod.GET)
	public ModelAndView login(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		return modelAndView;
	}
	
	@RequestMapping(value="/access-denied", method = RequestMethod.GET)
	public ModelAndView accessDenied(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("access-denied");
		return modelAndView;
	}
	
	/************************   Admin-Maker role Starts  *******************************/
	
	@RequestMapping(value="/admin_maker/home", method = RequestMethod.GET)
	public ModelAndView adminMakerHome(HttpSession session){
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("This is admin-maker");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userService.findUserByEmail(auth.getName());
		session.setAttribute("loginedUser", user);
		session.setAttribute("Authority", auth.getAuthorities().toString());
		modelAndView.setViewName("admin_maker/home");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin_maker/message", method = RequestMethod.GET)
	public ModelAndView message() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("message", new Message());
		modelAndView.setViewName("admin_maker/message");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin_maker/message", method = RequestMethod.POST)
	public ModelAndView storeMessage(@Valid @ModelAttribute("message") Message message, BindingResult bindingResult) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("message post");
		if(bindingResult.hasErrors()) {
			modelAndView.addObject("responseMessage","Error found");			
		} else {
			messageService.saveMessage(message);
			modelAndView.addObject("responseMessage","Successfully Saved");
			modelAndView.addObject("message",new Message());
		}
		modelAndView.setViewName("admin_maker/message");
		return modelAndView;
	}
	
	/************************   Admin-Maker role Ends  *******************************/
	
	
	/************************   Admin-Checker role Starts  ***************************/
	
	@RequestMapping(value="/admin_checker/home", method = RequestMethod.GET)
	public ModelAndView adminCheckerHome(HttpSession session){
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("This is admin-checker");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userService.findUserByEmail(auth.getName());
		session.setAttribute("loginedUser", user);
		session.setAttribute("Authority", auth.getAuthorities().toString());
		modelAndView.setViewName("admin_checker/home");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin_checker/message", method = RequestMethod.GET)
	public ModelAndView messageEdit() {
		ModelAndView modelAndView = new ModelAndView();
		List<Message> message = messageRepository.findAll();
		modelAndView.addObject("emaillist", message);
		modelAndView.setViewName("admin_checker/message");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin_checker/approve", method = RequestMethod.GET)
	public String messageApprove(@RequestParam("id") Integer id) {
		Message message = messageService.findMessageById(id);
		messageService.saveApproveStatus(message);
		return "redirect:/admin_checker/message";
	}
	
	@RequestMapping(value="/admin_checker/deny", method = RequestMethod.GET)
	public String messageDeny(@RequestParam("id") Integer id) {
		Message message = messageService.findMessageById(id);
		messageService.saveDenyStatus(message);
		return "redirect:/admin_checker/message";
	}
	
	/************************   Admin-Checker role Ends  ******************************/
	
	
	
	/************************   SuperAdmin role Starts  *******************************/

	@RequestMapping(value="/superadmin/home", method = RequestMethod.GET)
	public ModelAndView superAdminHome(HttpSession session){
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("This is super admin");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		User user = userService.findUserByEmail(auth.getName());
		session.setAttribute("loginedUser", user);
		session.setAttribute("Authority", auth.getAuthorities().toString());
		modelAndView.setViewName("superadmin/home");
		return modelAndView;
	}
	
	@RequestMapping(value="/superadmin/add_admin", method = RequestMethod.GET)
	public ModelAndView registration(){
		ModelAndView modelAndView = new ModelAndView();
		User user = new User();
		modelAndView.addObject("user", user);
		modelAndView.setViewName("superadmin/add_admin");
		return modelAndView;
	}
	
	@RequestMapping(value = "/superadmin/add_admin", method = RequestMethod.POST)
	public ModelAndView createNewUser(@RequestParam("cmStatus") String role,@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.print("This is add admin");
		User userExists = userService.findUserByEmail(user.getEmail());
		if (userExists != null) {
			bindingResult
					.rejectValue("email", "error.user",
							"There is already a user registered with the email provided");
		}
		if (bindingResult.hasErrors()) {
			modelAndView.addObject("responseMessage", "Error adding admin.");
			modelAndView.setViewName("superadmin/add_admin");
		} else {
			userService.saveUser(user,role);
			modelAndView.addObject("responseMessage", "Admin has been successfully added.");
			modelAndView.addObject("user", new User());
			modelAndView.setViewName("superadmin/add_admin");
			
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/superadmin/admin_detail", method = RequestMethod.POST)
	public ModelAndView searchAdmin(@Valid @ModelAttribute("admin") User user, BindingResult bindingResult) {
		System.out.println("Search Admin");
		ModelAndView modelAndView = new ModelAndView();
		User userExists = userService.findUserByName(user.getName());
		List<User> users = Arrays.asList(userExists); //since using jstl tag for loop in view, it requires collection.
		if (userExists == null) {
			bindingResult
					.rejectValue("name", "error.user",
							"There is no user registered with that username.");
		}
		if (bindingResult.hasErrors()) {
			modelAndView.addObject("responseMessage","No user with that name is found.");
			modelAndView.setViewName("superadmin/admin_detail"); //goto superadmin/admin_detail path. CHANGE
		} else {
			modelAndView.addObject("AdminList", users);
			modelAndView.addObject("responseMessage", "Found Successfully.");
			modelAndView.setViewName("superadmin/admin_detail");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/superadmin/admin_detail", method = RequestMethod.GET)
	public ModelAndView displayAdmins() {
		System.out.println("This is display admin");
		ModelAndView modelAndView = new ModelAndView();
		List<User> users = userRepository.findAll();
		modelAndView.addObject("admin", new User());
		modelAndView.addObject("AdminList", users);
		modelAndView.setViewName("superadmin/admin_detail");
		return modelAndView;
	}
	
	@RequestMapping(value="/superadmin/add_channel", method = RequestMethod.GET)
	public ModelAndView addChannel(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("channel", new Channel());
		modelAndView.setViewName("superadmin/add_channel");
		return modelAndView;
	}
	
	@RequestMapping(value="/superadmin/add_channel", method = RequestMethod.POST)
	public ModelAndView createChannel(@ModelAttribute("channel") Channel channel, BindingResult bindingResult){
		ModelAndView modelAndView = new ModelAndView();
		System.out.print("This is add channel");
		if (bindingResult.hasErrors()) {
			modelAndView.addObject("responseMessage", "Error adding channel.");
			modelAndView.setViewName("superadmin/add_channel");
		} else {
			channelService.saveChannel(channel);
			modelAndView.addObject("responseMessage", "Channel has been successfully added.");
			modelAndView.addObject("channel", new Channel());
			modelAndView.setViewName("superadmin/add_channel");			
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/superadmin/channel", method = RequestMethod.GET)
	public ModelAndView channelView() {
		System.out.println("This is display channel");
		ModelAndView modelAndView = new ModelAndView();
		List<Channel> channels = channelRepository.findAll();
		modelAndView.addObject("channel", channels);
		modelAndView.setViewName("superadmin/channel");
		return modelAndView;
	}
	
	@RequestMapping(value="/superadmin/message", method = RequestMethod.GET)
	public ModelAndView messageView() {
		System.out.println("This is display message");
		ModelAndView modelAndView = new ModelAndView();
		List<Message> message = messageRepository.findAll();
		modelAndView.addObject("emaillist", message);
		modelAndView.setViewName("superadmin/message");
		return modelAndView;
	}
	
	@RequestMapping(value="/superadmin/editAdmin", method = RequestMethod.GET)
	public ModelAndView editAdmin(@RequestParam("id") int id) {
		System.out.println("This is edit admin");
		User user = userService.findUserById(id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("user", user);
		modelAndView.addObject("admin",new User());
		modelAndView.setViewName("superadmin/editAdmin");
		return modelAndView;
	}
	
	@RequestMapping(value="/superadmin/editAdmin", method = RequestMethod.POST)
	public String saveEditAdmin(@RequestParam("newpassword") String password,@Valid @ModelAttribute("admin") User user, BindingResult bindingResult) {
		System.out.println("Edited Admin");
		if (bindingResult.hasErrors()) {
			System.out.println("Edited Admin Error");
			return "redirect:/superadmin/admin_detail";
		} else {
			if(password!=null && !password.isEmpty())
				userService.saveUserAndPassword(user,password);
			else
				userService.saveUser(user);
			return "redirect:/superadmin/admin_detail";
		}
	}
	
	@RequestMapping(value="/superadmin/editChannel", method = RequestMethod.GET)
	public ModelAndView editChannel(@RequestParam("id") int id) {
		System.out.println("This is edit channel");
		Channel channel = channelService.findChannelById(id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("euser", channel);
		modelAndView.addObject("channel",new Channel());
		modelAndView.setViewName("superadmin/editChannel");
		return modelAndView;
	}
	
	@RequestMapping(value="/superadmin/editChannel", method = RequestMethod.POST)
	public String saveEditChannel(@Valid @ModelAttribute("channel") Channel channel, BindingResult bindingResult) {
		System.out.println("Edited channel");
		channelService.saveChannel(channel);
		return "redirect:/superadmin/channel";
	}
	
	@RequestMapping(value="/superadmin/deleteChannel", method = RequestMethod.GET)
	public String deleteChannel(@RequestParam("id") int id) {
		System.out.println("Delete Channel");
		channelService.deleteChannelById(id);
		return "redirect:/superadmin/channel";
	}	
	/************************   SuperAdmin role Ends  *******************************/
}