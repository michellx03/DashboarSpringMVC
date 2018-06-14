<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityManager"%>

<%@page import="br.com.dashboardspringmvc.uteis.ConexaoEntityFactory"%>
<%@page import="java.util.List"%>

<c:set var="bodyContent">

	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><a href="/DashboardSpringMVC/dashboard/index">Dashboard</a>
				<i class="fa fa-circle"></i></li>
			<li><span>Usuario</span><i class="fa fa-circle"></i></li>
			<li><span>Controle Acesso</span></li>
			<li><span>Consulta</span></li>

		</ul>
		<div class="page-toolbar">
			<div class="btn-group pull-right"></div>
		</div>
	</div>
	<!-- END PAGE BAR -->
	<!-- BEGIN PAGE TITLE-->
	<h1 class="page-title">
		Controlle de Acesso <small></small>
	</h1>
	<!-- END PAGE TITLE-->
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN EXAMPLE TABLE PORTLET-->
			<div class="portlet light bordered">
				<div class="portlet-title">
					<%
						try {
					%>
					<%
						if (request.getParameter("mensagem").equals("falha")) {
					%>
					<div style="width: 100%" class="alert alert-danger ">
						<button class="close" data-close="alert"></button>
						Erro ao efetuar operação!
					</div>
					<%
						}
								if (request.getParameter("mensagem").equals("sucesso")) {
					%>
					<div style="width: 100%" class="alert alert-success ">
						<button class="close" data-close="alert"></button>
						Sucesso ao efetuar operação!
					</div>
					<%
						}
					%>
					<%
						} catch (NullPointerException ex) {
							}
					%>
					

				</div>
				<div class="portlet-title">
					<div class="caption font-dark">
						<i class="icon-settings font-dark"></i> <span
							class="caption-subject bold uppercase">Opções</span>
					</div>
					<div class="tools"></div>
				</div>
				<div class="portlet-body">
					<table class="table table-striped table-bordered table-hover"
						id="sample_1">
						<thead>
							<tr>
								<th>Usuario</th>
								<th>Regras</th>
								<th style="width: 87px;" class="hidden-xs">Ações</th>
							</tr>
						</thead>

						<tbody>

							<%
								EntityManager em = new ConexaoEntityFactory().getEntityManager();
									Query query = (Query) em.createNativeQuery("SELECT usua_usuario, string_agg(regr_nome_exibido, ', ') "+	 
											 " FROM controle_acesso.usuario  "+
											 " LEFT JOIN controle_acesso.usuario_regra "+
											 " ON (usua_id=usre_usua_id  ) "+
											 " LEFT JOIN controle_acesso.regra "+ 
											 " ON (usre_regr_id = regr_id) "+
											 " GROUP  BY 1");
									List<Object[]> list = query.getResultList();
									for (Object[] obj : list) {
							%>

							<tr>
								<td>
									<%
										out.print(obj[0]);
									%>
								</td>
								<td>
									<%
										out.print(obj[1] == null ? "" :obj[1].toString() );
									%>
								</td>
								<td class="hidden-xs">
									<div class="btn-group pull-right">
										<button class="btn green btn-xs btn-outline dropdown-toggle"
											data-toggle="dropdown">
											Ações <i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right">
											<li><a
												href="/DashboardSpringMVC/ControleAcesso/Alteracao?usuario=<%out.print(obj[0]);%>">
													<i class="fa fa-edit"></i> Alterar
											</a></li>
										</ul>
									</div>
								</td>

							</tr>
							<%
								}
							%>

						</tbody>
					</table>
				</div>
			</div>
			<!-- END EXAMPLE TABLE PORTLET-->
			<!-- BEGIN EXAMPLE TABLE PORTLET-->
			<!-- END EXAMPLE TABLE PORTLET-->
		</div>
	</div>


</c:set>
<t:master>

	<jsp:attribute name="scripts_css">
 <link
			href="/DashboardSpringMVC/assets/global/plugins/datatables/datatables.min.css"
			rel="stylesheet" type="text/css" />
        <link
			href="/DashboardSpringMVC/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css"
			rel="stylesheet" type="text/css" />
        <link
			href="/DashboardSpringMVC/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css"
			rel="stylesheet" type="text/css" />
        
       
</jsp:attribute>

	<jsp:attribute name="scripts_js_page_level_plugins">

<script src="/DashboardSpringMVC/assets/global/scripts/datatable.js"
			type="text/javascript"></script>
        <script
			src="/DashboardSpringMVC/assets/global/plugins/datatables/datatables.min.js"
			type="text/javascript"></script>
        <script
			src="/DashboardSpringMVC/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js"
			type="text/javascript"></script>
        <script
			src="/DashboardSpringMVC/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"
			type="text/javascript"></script>
       
</jsp:attribute>
	<jsp:attribute name="scripts_js_page_level_scripts">
	<script>
		$(document).ready(function() {
			$("#usuarioli").addClass('active open');
			$("#controle_acesso_li_consulta").addClass('active open');

		});
	</script>

<script
			src="/DashboardSpringMVC/assets/pages/scripts/table-datatables-buttons.min.js"
			type="text/javascript"></script>
			
			
                
</jsp:attribute>
	<jsp:body>
${bodyContent}    
</jsp:body>
</t:master>


