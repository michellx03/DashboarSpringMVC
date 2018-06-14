package br.com.dashboardspringmvc.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.dashboardspringmvc.model.UsuarioModel;

@Controller
@RequestMapping("/sistema")
public class LoginController {


	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/login")
	public String efetuaLogin(@RequestParam(value = "username") String usuario,
			@RequestParam(value = "password") String senha, HttpSession session) {
        
		Logger logger = Logger.getLogger("info");
		
		logger.debug("O seguinte usuario esta tantando fazer login: "+usuario);
		UsuarioModel usua = new UsuarioModel();
		if (usua.VerificarAutenticacao(usuario, senha)) {
			logger.debug("Login do usuario com sucesso: "+usuario);
			session.setAttribute("usuarioLogado", usuario);
			return "redirect:/dashboard/index";

		}
		logger.info("Credencias do usuairo nao validas");
		return "redirect:/?login=incorreto";
	}

}