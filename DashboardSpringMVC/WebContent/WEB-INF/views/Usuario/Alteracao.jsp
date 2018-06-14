<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="br.com.dashboardspringmvc.uteis.ConexaoEntityFactory"%>
<%@page
	import="br.com.dashboardspringmvc.daoGenericos.UsuarioDaoImplementacao"%>
<%@page import="br.com.dashboardspringmvc.daoGenericos.UsuarioDao"%>
<%@page import="br.com.dashboardspringmvc.entity.Usuario"%>

<%
UsuarioDao usuarioDAO = new UsuarioDaoImplementacao();
Usuario usuario = usuarioDAO.getById(Usuario.class, Integer.parseInt(request.getAttribute("id").toString()));
%>

<c:set var="bodyContent">


	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><a href="/DashboardSpringMVC/dashboard/index">Dashboard</a>
				<i class="fa fa-circle"></i></li>
			<li><span> Usuario</span> <i class="fa fa-circle"></i></li>
			<li><a href="/DashboardSpringMVC/Usuario/Consulta">Consulta</a>
				<i class="fa fa-circle"></i></li>
			<li><span>Alteração</span></li>
		</ul>
		<div class="page-toolbar"></div>
	</div>

	<!-- END PAGE BAR -->
	<!-- BEGIN PAGE TITLE-->
	<h1 class="page-title">
		Alteração de Usuario <small>Campos Obrigatórios (*)</small>
	</h1>
	<!-- END PAGE TITLE-->
	<!-- END PAGE HEADER-->

	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<div class="portlet light portlet-fit portlet-form bordered"
				id="form_wizard_1">

				<div class="row">
					<div class="col-md-12">
						<!-- BEGIN VALIDATION STATES-->
						<div class="portlet light portlet-fit portlet-form bordered">

							<div class="portlet-body">
								<!-- BEGIN FORM-->
								<form action="/DashboardSpringMVC/Usuario/Salvar"
									id="form_sample_2" class="form-horizontal">
									<div class="form-body">
										<div style="width: 90%; margin-left: 5%;"
											class="alert alert-danger display-hide">
											<button class="close" data-close="alert"></button>
											Por favor verifique os erros abaixo!
										</div>

										<input style="display: none" type="text" class="form-control"
											value="<%out.print(request.getAttribute("id"));%>"
											name="usuaId" />

										<div class="form-group  margin-top-20">
											<label class="control-label col-md-3">Usuario <span
												class="required"> * </span>
											</label>
											<div class="col-md-4">
												<div class="input-icon right">
													<i class="fa"></i> <input type="text" class="form-control"
														required value="<%out.print(usuario.getUsuaUsuario()); %>"
														name="usuaUsuario" />
												</div>
											</div>
										</div>
										<div class="form-group  margin-top-20">
											<label class="control-label col-md-3">Senha <span
												class="required"> * </span>
											</label>
											<div class="col-md-4">
												<div class="input-icon right">
													<i class="fa"></i> <input type="password" id="senha"
														value="<%out.print(usuario.getUsuaSenha()); %>"
														class="form-control" required name="usuaSenha" />
												</div>
											</div>
										</div>
										<div class="form-group  margin-top-20">
											<label class="control-label col-md-3">Repita a Senha
												<span class="required"> * </span>
											</label>
											<div class="col-md-4">
												<div class="input-icon right">
													<i class="fa"></i> <input type="password" equalTo="#senha"
														value="<%out.print(usuario.getUsuaSenha()); %>"
														class="form-control" required />
												</div>
												<div class="help-block with-errors"></div>
											</div>
										</div>
									</div>



									<div class="form-actions">
										<div class="row">
											<div class="col-md-offset-3 col-md-9">
												<button type="submit" class="btn green">Alterar</button>
											</div>
										</div>
									</div>
								</form>
								<!-- END FORM-->
							</div>
						</div>
						<!-- END VALIDATION STATES-->
					</div>
				</div>
			</div>
		</div>
	</div>



</c:set>
<t:master>

	<jsp:attribute name="scripts_css">
        
</jsp:attribute>

	<jsp:attribute name="scripts_js_page_level_plugins">

        <script
			src="/DashboardSpringMVC/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
			type="text/javascript"></script>
<script
			src="/DashboardSpringMVC/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"
			type="text/javascript"></script>
                       
</jsp:attribute>
	<jsp:attribute name="scripts_js_page_level_scripts">
	<script>
$(document).ready(function(){
	$("#usuarioli").addClass('active open');
	$("#usuario_li_consulta").addClass('active open');
	
	
});
			</script>

<script
			src="/DashboardSpringMVC/assets/pages/scripts/form-validation.min.js"
			type="text/javascript"></script>
        			
                
</jsp:attribute>
	<jsp:body>
${bodyContent}    
</jsp:body>
</t:master>


