<%@include file="/common/header.jsp"%>

<!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
      <div class="container">
        <h2 class="main-title">Perfil de Usuario</h2>
        	
        <div class="row">
          <div class="col-lg-9">
            <div class="chart">
            	<table class="table">
                                
                                <tbody>
                                    <tr>
                                        <th scope="row"><img class="iconoTable" src="<%=context%>/img/logo/bee.png"/></th>
                                        <td>Nombre: </td>
                                        <td><%=usuario.getNombre()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><img class="iconoTable" src="<%=context%>/img/logo/bee.png"/></th>
                                        <td>Apellido 1: </td>
                                        <td><%=usuario.getApellido()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><img class="iconoTable" src="<%=context%>/img/logo/bee.png"/></th>
                                        <td>Apellido 2: </td>
                                        <td><%=usuario.getSegundoApellido()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><img class="iconoTable" src="<%=context%>/img/logo/bee.png"/></th>
                                        <td>Nombre Comercial: </td>
                                        <td><%=usuario.getNombreComercial()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><img class="iconoTable" src="<%=context%>/img/logo/bee.png"/></th>
                                        <td>DNI: </td>
                                        <td><%=usuario.getDni()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><img class="iconoTable" src="<%=context%>/img/logo/bee.png"/></th>
                                        <td>Teléfono: </td>
                                        <td><%=usuario.getTelefono()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><img class="iconoTable" src="<%=context%>/img/logo/bee.png"/></th>
                                        <td>Email: </td>
                                        <td><%=usuario.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><img class="iconoTable" src="<%=context%>/img/logo/bee.png"/></th>
                                        <td>R.E.G.A.: </td>
                                        <td><%=usuario.getRega()%></td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                         </div>
            <article class="white-block">
              <div class="top-cat-title">
                <h3></h3>
                <p></p>
              </div>
             


	
<%@include file="/common/footer.jsp"%>