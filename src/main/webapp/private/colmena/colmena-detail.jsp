

<%@include file="/common/header.jsp"%>
<!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
      <div class="container">
        <h2 class="main-title">Resultados</h2>
        	
        <div class="row">
          <div class="col-lg-9">
            <div class="chart">
              

				<%
				Colmena c = (Colmena) request.getAttribute(AttributeNames.COLMENA);
				%>
				<%=c.getFechaAlta() %>
				<%=c.getTipoOrigenId() %>
            </div>
          </div>
          <div class="col-lg-3">
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
    
    <%@include file="/common/footer.jsp"%>