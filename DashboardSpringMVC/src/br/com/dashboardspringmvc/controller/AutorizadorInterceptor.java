package br.com.dashboardspringmvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import br.com.dashboardspringmvc.model.ControleAcessoModel;
import br.com.dashboardspringmvc.uteis.ConexaoEntityFactory;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
			throws Exception {

		String uri = request.getRequestURI();

		if (uri.endsWith("login") || uri.endsWith("AreaAdministrativa") || uri.contains("assets") || uri.contains("AcessoNegado")) {
			return true;
		}

		if (request.getSession().getAttribute("usuarioLogado") != null) {

			ControleAcessoModel cam = new ControleAcessoModel();
			String controllerNome = cam.getNomeController(request);
			if (cam.usuarioLogadoTemAcesso(controllerNome, request) == false) {
				response.sendRedirect("/AreaAdministrativa/ControleAcesso/AcessoNegado");
				return false;
			}
			return true;
		}

		response.sendRedirect("/AreaAdministrativa");
		return false;
	}
}
