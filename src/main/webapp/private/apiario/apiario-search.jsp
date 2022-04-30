<%@include file="/common/header.jsp"%>

<script>

function buscarApiarios(){
	var url = '/XesmelWeb/apiarioWebService';
		$.ajax({
			type: "GET",
			url: url,
			data:"action=search&usuario-id=<%=usuario.getId()%>",
			succes: function(data){
				for (i=0;i<data.length;i++){
					$('#apiariosTotal').append('<td value="'+data[i].id+'">'+data[i].ubicacion+'</td>');
				}
			}
		});
	}

</script>
<!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
      <div class="container">
        <h2 class="main-title"></h2>
        	
        <div class="row">
          <div class="col-lg-12">
            <div class="chart">
           		<p class="sign-up__subtitle">Resultados de apiarios de <%=usuario.getNombreComercial()%></p>
								
							<div class="users-table table-wrapper">
				              <table class="posts-table">
				                <thead>
				                  <tr class="users-table-info">
				                    <th>Id Apiario</th>
				                    <th>Nombre</th>
				                    <th>Ubicación</th>
				                    <th>Latitud</th>
				                    <th>Longitud</th>
				                  </tr>
				                </thead>
				                <tbody>
				                  <tr id="apiariosTotal">
				                 
				                  </tr>
				                </tbody>
				              </table>
				            </div>
				            </div>
				            
				          </div>
          <div class="mb-3">
          <form action="<%=context%>/user?action=<%=ActionNames.DELETE%>" method ="post">
          <input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ActionNames.DELETE%>">
          <button type="submit" class="form-btn primary-default-btn transparent-btn">Eliminar Apiario</button><br>
	       </div>
          
        </div>
      </div>
    </main>
    
<script>$(document).ready(buscarApiarios());</script>    
<%@include file="/common/footer.jsp"%>