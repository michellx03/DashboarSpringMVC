package br.com.dashboardspringmvc.controller;

import org.dom4j.rule.Mode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.dashboardspringmvc.daoGenericos.ProdutoDAO;
import br.com.dashboardspringmvc.daoGenericos.ProdutoDAOImplementacao;
import br.com.dashboardspringmvc.entity.Produto;

@Controller
@RequestMapping("/Produto")
public class ProdutoController {
	
	@RequestMapping("/Consulta")
	public ModelAndView ViewDashboardIndex() {
		ModelAndView view = new ModelAndView("Produto/Consulta");
		return view;
	}
	
	@RequestMapping("/Cadastro")
	public ModelAndView Cadastro() {
		Produto produto = new Produto();
		ModelAndView view = new ModelAndView("Produto/CadastroOrEditar");
		view.addObject("produto", produto);
		return view;
	}
	
	@RequestMapping("/Editar")
	public ModelAndView Editar(@RequestParam("id") int id) {
		ProdutoDAO dao = new ProdutoDAOImplementacao();
		Produto produto = dao.getById(Produto.class, id);
		ModelAndView view = new ModelAndView("Produto/CadastroOrEditar");
		view.addObject("produto", produto);
		return view;
	}
	
	@RequestMapping("/Excluir")
	public String Excluir(@RequestParam("id") int id) {
		try {
			ProdutoDAO dao = new ProdutoDAOImplementacao();
			Produto produto = dao.getById(Produto.class, id);
			dao.remove(produto);
			return "redirect:/Produto/Consulta?mensagem=sucesso";
		}catch(Exception ex) {
			return "redirect:/Produto/Consulta?mensagem=falha";
		}
	}
	
	@RequestMapping(value = "/Salvar", method = RequestMethod.POST)
	public String Salvar(Produto produto) {
		try {
			ProdutoDAO dao = new ProdutoDAOImplementacao();
			dao.save(produto);
			return "redirect:/Produto/Consulta?mensagem=sucesso";
		}catch(Exception ex) {
			System.out.println("Erro ao salvar " + ex);
			return "redirect:/Produto/Consulta?mensagem=falha";
		}
	}

}
