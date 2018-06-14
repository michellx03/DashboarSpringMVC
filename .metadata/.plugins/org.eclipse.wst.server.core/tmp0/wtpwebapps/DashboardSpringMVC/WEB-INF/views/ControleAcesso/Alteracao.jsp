<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="br.com.dashboardspringmvc.uteis.ConexaoEntityFactory"%>

<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityManager"%>

<%@page import="br.com.dashboardspringmvc.uteis.ConexaoEntityFactory"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%
								EntityManager em2 = new ConexaoEntityFactory().getEntityManager();
									Query query2 = (Query) em2.createNativeQuery("SELECT regr_id,regr_nome_exibido,usua_id FROM controle_acesso.usuario_regra "+
											" INNER JOIN controle_acesso.usuario "+
											" ON (usre_usua_id = usua_id) "+
											" INNER JOIN controle_acesso.regra "+
											" ON (usre_regr_id = regr_id) "+
											" WHERE usua_usuario='"+request.getAttribute("usuario").toString()+"'");
									List<Object[]> list2 = query2.getResultList();
									List<Integer> listIds = new ArrayList<Integer>();
									for (Object[] obj : list2) {
							        listIds.add(Integer.parseInt(obj[0].toString()));
									}
							%>

<c:set var="bodyContent">


	<div class="page-bar">
		<ul class="page-breadcrumb">
			<li><a href="/DashboardSpringMVC/dashboard/index">Dashboard</a>
				<i class="fa fa-circle"></i></li>
			<li><span>Controle Acesso</span> <i class="fa fa-circle"></i></li>
			<li><a href="/DashboardSpringMVC/ControleAcesso/Consulta">Consulta</a>
				<i class="fa fa-circle"></i></li>
			<li><span>Alteração</span></li>

		</ul>
		<div class="page-toolbar">
			<div class="btn-group pull-right"></div>
		</div>
	</div>
	<!-- END PAGE BAR -->
	<!-- BEGIN PAGE TITLE-->
	<h1 class="page-title">
		Controle de Acesso <small></small>
	</h1>

	<!-- END PAGE TITLE-->
	<!-- END PAGE HEADER-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN PORTLET-->
			<div class="portlet light form-fit bordered">
				<div class="portlet-title"></div>
				<div class="portlet-body form">
					<!-- BEGIN FORM-->
					<form action="/DashboardSpringMVC/ControleAcesso/Salvar"
						class="form-horizontal form-bordered">
						<div class="form-body">

							<input style="display: none" type="text"
								value="<%out.print(request.getAttribute("usuario").toString()); %>"
								name="usuario" />
								
							<%
								EntityManager em = new ConexaoEntityFactory().getEntityManager();
									Query query = (Query) em.createNativeQuery("SELECT regr_id,regr_nome_exibido FROM controle_acesso.regra "+
											 " ORDER BY regr_nome_exibido");
									List<Object[]> list = query.getResultList();
									for (Object[] obj : list) {
							%>

							<div class="form-group">
								<label class="control-label col-md-3">
									<%out.print(obj[1]); %>
								</label>
								<div class="col-md-9">
									<input type="checkbox" name="<%out.print(obj[0]); %>"
										class="make-switch"
										<%if(listIds.contains(obj[0]))out.print("checked"); %>
										data-on-text="<i class='fa fa-check'></i>"
										data-off-text="<i class='fa fa-times'></i>">
								</div>


							</div>
							<%} %>

							<div class="form-actions">
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
										<button type="submit" class="btn green">Salvar</button>
									</div>
								</div>
							</div>


						</div>
					</form>
				</div>
				<!-- END PORTLET-->
			</div>
		</div>
	</div>



</c:set>
<t:master>

	<jsp:attribute name="scripts_css">
        
</jsp:attribute>

	<jsp:attribute name="scripts_js_page_level_plugins">

                       
</jsp:attribute>
	<jsp:attribute name="scripts_js_page_level_scripts">
	
	 <script
			src="/DashboardSpringMVC/assets/pages/scripts/components-bootstrap-switch.min.js"
			type="text/javascript"></script>
       
	<script>
$(document).ready(function(){
	$("#usuarioli").addClass('active open');
	$("#controle_acesso_li_consulta").addClass('active open');
	
	
});
			</script>

        			
                
</jsp:attribute>
	<jsp:body>
${bodyContent}    
</jsp:body>
</t:master>


