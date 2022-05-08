<%@include file="/common/header.jsp"%>
<!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
      <div class="container">
        <h2 class="main-title"></h2>
         	
	        <div class="row">
	          <div class="col-lg-12">
	            <div class="chart">
	
					<p class="sign-up__subtitle">Introduce a continuación los datos de la colmena:</p>
	
					<form class="sign-up-form form" action="<%=request.getContextPath()+ControllerPaths.COLMENA%>" method="post">
	
					<%@include file="/common/errors.jsp"%>
					
							
					<input type="hidden" name="<%=ParameterNames.ACTION %>" value="<%=ActionNames.CREATE%>"/>
	     			 <label class="form-label-wrapper">
	    			 <p class="form-label">Codigo en Apiario</p>
	        		 <input class="form-input" type="text" name="<%=ParameterNames.COD_APIARIO %>"value="<%=ParameterUtils.print(request.getParameter(ParameterNames.COD_APIARIO))%>" placeholder="Codigo en apiario" required/>
					 </label>
					 <label class="form-label-wrapper">
	    			 <p class="form-label">Fecha de alta</p>
	        		 <input class="form-input" type="date" name="<%=ParameterNames.FECHA_ALTA%>"value="<%=ParameterUtils.print(request.getParameter(ParameterNames.FECHA_ALTA))%>" placeholder="Fecha alta" required/>
					 </label>
					 <label class="form-label-wrapper">
	    			 <p class="form-label">Fecha de baja</p>
	        		 <input class="form-input" type="date" name="<%=ParameterNames.FECHA_BAJA%>"value="<%=ParameterUtils.print(request.getParameter(ParameterNames.FECHA_BAJA))%>" placeholder="Fecha baja" />
					 </label>
					 <label class="form-label-wrapper">
	    			 <p class="form-label">ID Apiario</p>
	        		 <input class="form-input" type="text" name="<%=ParameterNames.APIARIO_ID%>"value="<%=ParameterUtils.print(request.getParameter(ParameterNames.APIARIO_ID))%>" placeholder="codigo apiario" required/>
					 </label>
					 <label class="form-label-wrapper">
	    			 <p class="form-label">Origen colmena</p>
	        		 <input class="form-input" type="text" name="<%=ParameterNames.TIPO_ORIGEN%>"value="<%=ParameterUtils.print(request.getParameter(ParameterNames.TIPO_ORIGEN))%>" placeholder="origen colmena" required/>
					 </label>
					 
					 <button type="submit" class="form-btn primary-default-btn transparent-btn">Registrar Colmena</button><br>
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