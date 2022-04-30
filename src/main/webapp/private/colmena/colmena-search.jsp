<%@include file="/common/header.jsp"%>
<!-- Main -->
    <main class="main users chart-page" id="skip-target">
      <div class="container">
        <h2 class="main-title">Resultados</h2>
        	
        <div class="row">
          <div class="col-lg-9">
            <div class="chart">
              
<!--aqui podemos  pintar resultados menu (arriba izquierda)-->
				<form action="<%=context%>/colmena" method="post">
		 			<input type="hidden" name="action" value="<%=ActionNames.SEARCH%>"/>
		
						<select class="form-select" aria-label="">
  						<option selected>Selecciona una opcion del menu:</option>
  						<option value="1">Dar de alta colmena</option>
  						<option value="2">Busqueda de colmena</option>  
						</select>
				</form>
            </div>
            
<!--desde aqui pintamos en el menu con checks(izquierda)-->

            
<!--hasta aqui menu con opciones(izquierda abajo)-->
          </div>
          <div class="col-lg-3">
            
<!--aqui podemos pintar a la izquierda(debajo del cuadro azul)-->

            <article class="white-block">
              <div class="top-cat-title">
                <h3></h3>
                <p></p>
              </div>
            </article>
          </div>
        </div>
      </div>
    </main>
 		<div class="caja_paginacion">
								<ul class="paginacion">
								<!--  Paginador  -->   
									<%
									Integer currentPage = (Integer) request.getAttribute(AttributeNames.CURRENT_PAGE);
								
									Integer pagingFrom = (Integer) request.getAttribute(AttributeNames.PAGING_FROM);
									Integer pagingTo = (Integer) request.getAttribute(AttributeNames.PAGING_TO);
									
									Integer totalPages = (Integer) request.getAttribute(AttributeNames.TOTAL_PAGES);
									
									Map<String,String[]> parameters = new HashMap<String, String[]>(request.getParameterMap());								
									parameters.remove(ParameterNames.PAGE); // para que no arrastre el valor anterior
									
									// Ya viene terminada en &
									String baseURL = ParameterUtils.getURL(request.getContextPath()+ControllerPaths.COLMENA, parameters);
	
									
									// Primera
									if (currentPage>1) {
									%> 
										<li><a href="<%=baseURL%>">Primera</a></li>
										<%
									}
	
									
									// Anterior
									if (currentPage>1) {
										%> 
										<li><a href="<%=baseURL+ParameterNames.PAGE+"="+(currentPage-1)%>">Anterior</a></li>
										<%
									}
									
									// Paginas antes de la actual
									for (int i = pagingFrom; i<currentPage; i++) {
											%> 
											<li>&nbsp;<a href="<%=baseURL+ParameterNames.PAGE+"="+i%>"><%=i%></a>&nbsp;</li>
											<% 
									}	
									
									// La actual
									%>&nbsp;<span class="paginacion_activa"><%=currentPage%></span>&nbsp;<%
									
									// Despues de la actual
									for (int i = currentPage+1; i<=pagingTo; i++) {
											%> 
											<li>&nbsp;<a href="<%=baseURL+ParameterNames.PAGE+"="+i%>"><%=i%></a>&nbsp;</li>
											<% 
									}
									
									// Siguiente
									if (currentPage<totalPages) {
										%>
											<li><a href="<%=baseURL+ParameterNames.PAGE+"="+(currentPage+1)%>">Siguiente</a></li>
										<%
									}
									
									
									// Última
									if (currentPage<totalPages) {
										%>
											<li><a href="<%=baseURL+ParameterNames.PAGE+"="+(totalPages)%>">Última</a></li>
										<%
								}
									
									%>
							</ul>
						</div>			
    <%@include file="/common/footer.jsp"%>