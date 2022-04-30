
<%@include file="/common/header.jsp"%>
<!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
      <div class="container">
        <h2 class="main-title">Resultados</h2>
        <%
		List<Colmena> colmenas = (List<Colmena>) request.getAttribute(AttributeNames.COLMENAS);
		for (Colmena c : colmenas) {
		%>	
		<p>
			<a
			href="<%=context%>/colmena?action=detail&colmena-id=<%=c.getId()%>"><%=c.getCodEnApiario()%>
			a <%=c.getFechaAlta()%></a>
		</p>
		<%
		}
		%>        	
        <div class="row">
          <div class="col-lg-9">
            <div class="chart">
              
<!--aqui podemos  pintar resultados menu (arriba izquierda)-->

            </div>

<!--desde aqui pintamos en el menu con checks(izquierda)-->

            
<!--hasta aqui menu con opciones(izquierda abajo)-->
          </div>
          <div class="col-lg-3">
            
<!--aqui podemos pintar a la izquierda(debajo del cuadro azul)-->

            <article class="white-block">
              <div class="top-cat-title">
                <h3>resultados(pintar aqui)</h3>
                <p></p>
              </div>
             





            </article>
          </div>
        </div>
      </div>
    </main>
    
    <%@include file="/common/footer.jsp"%>