
    <%@include file="/common/header.jsp"%>
<!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
      <div class="container">
        <h2 class="main-title"></h2>
         	
	        <div class="row">
	          <div class="col-lg-12">
	            <div class="chart">
	
					<p class="sign-up__subtitle">Introduce a continuación los datos del apiario:</p>
	
					<form class="sign-up-form form" action="<%=request.getContextPath()+ControllerPaths.APIARIO%>" method="post">
	
					<%@include file="/common/errors.jsp"%>
					
							
					<input type="hidden" name="<%=ParameterNames.ACTION %>" value="<%=ActionNames.CREATE%>"/>
	     			 <label class="form-label-wrapper">
	    			 <p class="form-label">Nombre</p>
	        		 <input class="form-input" type="text" name="<%=ParameterNames.APIARIO_NAME %>"value="<%=ParameterUtils.print(request.getParameter(ParameterNames.APIARIO_NAME))%>" placeholder="Nombre" required/>
					 </label>
					 <label class="form-label-wrapper">
	    			 <p class="form-label">Ubicación</p>
	        		 <input class="form-input" type="text" name="<%=ParameterNames.UBICACION_APIARIO %>"value="<%=ParameterUtils.print(request.getParameter(ParameterNames.UBICACION_APIARIO))%>" placeholder="Ubicación" required/>
					 </label>
					 <label class="form-label-wrapper">
	    			 <p class="form-label">Latitud</p>
	        		 <input class="form-input" type="text" name="<%=ParameterNames.LATITUD_APIARIO %>"value="<%=ParameterUtils.print(request.getParameter(ParameterNames.LATITUD_APIARIO))%>" placeholder="Latitud" required/>
					 </label>
					 <label class="form-label-wrapper">
	    			 <p class="form-label">Longitud</p>
	        		 <input class="form-input" type="text" name="<%=ParameterNames.LONGITUD_APIARIO %>"value="<%=ParameterUtils.print(request.getParameter(ParameterNames.LONGITUD_APIARIO))%>" placeholder="Longitud" required/>
					 </label>
					 
					 <button type="submit" class="form-btn primary-default-btn transparent-btn">Registrar apiario</button><br>
	            	 </form>
	            </div>
	            <div class="users-table table-wrapper">
	              
	            </div>
	          </div>
	          <div class="col-lg-3">
            
            
          </div>
        </div>
      </div>
    </main>
    

             
    
    <%@include file="/common/footer.jsp"%>