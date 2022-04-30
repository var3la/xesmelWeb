<%@include file="/common/header.jsp"%>

	<main class="main users chart-page" id="skip-target">
      <div class="container">
        <h2 class="main-title">Actualizar datos: </h2>        	
	        <div class="row">
	          <div class="col-lg-12">
	            <div class="chart">
	              	 <form action="<%=context+ControllerPaths.USER%>" method= "post">
	              	 	<input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ActionNames.UPDATE%>">
	              	 	<label class="form-label-wrapper">
	    			 	<p class="form-label">Nombre</p>
	        		 	<input class="form-input" type="text" id="name" name="<%=ParameterNames.USER_NAME %>"value="<%=ParameterUtils.print(usuario.getNombre())%>" placeholder="Nombre" required/>
					 	</label>
					 	<label class="form-label-wrapper">
	    			 	<p class="form-label">Apellido</p>
	        		 	<input class="form-input" type="text" id="apellido1" name="<%=ParameterNames.LAST_NAME %>"value="<%=ParameterUtils.print(usuario.getApellido())%>" placeholder="Apellido 1" required/>
					 	</label>
					 	<label class="form-label-wrapper">
	    			 	<p class="form-label">Segundo apellido</p>
	        		 	<input class="form-input" type="text" id="apellido2" name="<%=ParameterNames.LAST_NAME_TWO%>"value="<%=ParameterUtils.print(usuario.getSegundoApellido())%>" placeholder="Apellido 2" required/>
					 	</label>
					 	<label class="form-label-wrapper">
	    			 	<p class="form-label">Nombre Comercial</p>
	        		 	<input class="form-input" type="text" id="nombreComercial" name="<%=ParameterNames.TRADENAME%>"value="<%=ParameterUtils.print(usuario.getNombreComercial())%>" placeholder="Nombre Comercial" required/>
					 	</label>
					 	<label class="form-label-wrapper">
	    			 	<p class="form-label">DNI</p>
	        		 	<input class="form-input" type="text" id="dni" name="<%=ParameterNames.DNI%>"value="<%=ParameterUtils.print(usuario.getDni())%>" placeholder="DNI" required/>
					 	</label>
					 	<label class="form-label-wrapper">
	    			 	<p class="form-label">Teléfono</p>
	        		 	<input class="form-input" type="text" id="telefono" name="<%=ParameterNames.PHONE%>"value="<%=ParameterUtils.print(usuario.getTelefono())%>" placeholder="Teléfono" required/>
					 	</label>
					 	
					 	<label class="form-label-wrapper">
	    			 	<p class="form-label">R.E.G.A.</p>
	        		 	<input class="form-input" type="text" id="rega" name="<%=ParameterNames.REGA%>"value="<%=ParameterUtils.print(usuario.getRega())%>" placeholder="REGA" required/>
					 	</label>
					 	
	              	 	<button type="submit" class="form-btn primary-default-btn transparent-btn">Actualizar</button><br>
	              	 </form>				
	            </div>
	            <div class="users-table table-wrapper"></div>
	          </div>
	          <div class="col-lg-3"></div>          
	        </div>
      </div>
    </main>

<%@include file="/common/footer.jsp"%>