<%@include file="/common/header.jsp"%>
<script>
function buscarApiarios(){
	var url = '/XesmelWeb/apiario';
		$.ajax({
			type: "GET",
			url: url,
			data:"action=apiarioSearch",
			succes: function(data){
				for i=0;i<data.length;i++){
					$('#apiariosTotal').append('<td value="'+data[i].id+'">'+data[i].nombre+'</td>');
				}
			}
		});
}

</script>
<%
			Results<Usuario> results = (Results<Usuario>)request.getAttribute(AttributeNames.USUARIO);
			List<Usuario> usuarios = results.getData();
			for (Usuario u:usuarios){
%>	
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
                  <tr>
                    <td>
                      <label class="users-table__checkbox">
                        <%=u.getNombre() %>
                        <div class="categories-table-img">
                          
                        </div>
                      </label>
                    </td>
                    <td></td>
                    <td>
                      <div class="pages-table-img"id="apiariosTotal"></div>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                  
                </tbody>
              </table>
            </div>

<%
			}
%>


<script>$(document).ready(buscarApiarios());</script>
<%@include file="/common/footer.jsp"%>