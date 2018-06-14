package br.com.dashboardspringmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

	
	@RequestMapping(value = "/index")
	public ModelAndView ViewDashboardIndex() {
		ModelAndView view = new ModelAndView("Dashboard/index");
		return view;

	}


	
}
