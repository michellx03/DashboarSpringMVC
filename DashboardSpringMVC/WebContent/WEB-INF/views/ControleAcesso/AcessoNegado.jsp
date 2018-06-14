<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityManager"%>

<%@page import="br.com.dashboardspringmvc.uteis.ConexaoEntityFactory"%>
<%@page import="java.util.List"%>

<c:set var="bodyContent">

<div class="page-bar">


</div>                        
<h1 class="page-title"> 

                            <small></small>
                        </h1>
                        <!-- END PAGE TITLE-->
                        <!-- END PAGE HEADER-->
                        <div class="row">
                            <div class="col-md-12 page-404" style="margin-top: 10%;">
                                <div class="number font-green"> Bloqueado </div>
                                <div class="details">
                                    <h3>Oops! Acesso Negado.</h3>
                                    <p> Você não tem permissão para acessar esta página.
                                        <br/>
                                        
                                </div>
                            </div>
                        </div>


</c:set>
<t:master>

	<jsp:attribute name="scripts_css">
<link href="/AreaAdministrativa/assets/pages/css/error.min.css" rel="stylesheet" type="text/css" />
        
</jsp:attribute>
	<jsp:attribute name="scripts_js_page_level_plugins">
       
</jsp:attribute>
	<jsp:attribute name="scripts_js_page_level_scripts">
	
                
</jsp:attribute>
	<jsp:body>
${bodyContent}    
</jsp:body>
</t:master>


