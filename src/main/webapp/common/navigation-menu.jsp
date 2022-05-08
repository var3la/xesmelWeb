
 <%@page import="javax.swing.text.View"%>
<%@page import="com.jorge.xesmel.web.controller.utils.*"%>
 <%@page import="com.jorge.xesmel.model.*"%>
<div class="layer"></div>
<!-- ! Body -->
<a class="skip-link sr-only" href="#skip-target"></a>
<div class="page-flex">
  <!-- ! Sidebar -->
  <aside class="sidebar">
    <div class="sidebar-start">
        <div class="sidebar-head">
            <a class="logo-wrapper" title="Home">
                <span class="sr-only">Home</span>
                <span class="icon logo" aria-hidden="true"></span>
                <div class="logo-text">
                    <span class="logo-title">Xesmel</span>
                    <span class="logo-subtitle">Panel Gestión</span>
                </div>
            </a>
            <button class="sidebar-toggle transparent-btn" title="Menu" type="button">
                <span class="sr-only"></span>
                <span class="icon menu-toggle" aria-hidden="true"></span>
            </button>
        </div>
        <div class="sidebar-body">
            <ul class="sidebar-body-menu">
                <li>
                    <a class="active" href="<%=request.getContextPath()+ViewPaths.HOME%>"><span class="icon home" aria-hidden="true"></span>Menú Principal</a>
                </li>
                <li>
                    <a class="show-cat-btn" href="">
                        <span class="icon document" aria-hidden="true"></span>Apiario
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            <span class="icon arrow-down" aria-hidden="true"></span>
                        </span>
                    </a>
                    <ul class="cat-sub-menu">
                        <li>
                            <a href="<%=request.getContextPath()+ViewPaths.APIARIO_CREATE%>">Añadir</a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()+ViewPaths.APIARIO_SEARCH%>">Buscar</a>
                        </li>
                    </ul>
                        
                </li>
                <li>
                    <a class="show-cat-btn" href="">
                        <span class="icon folder" aria-hidden="true"></span>Colmena
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            <span class="icon arrow-down" aria-hidden="true"></span>
                        </span>
                    </a>
                    <ul class="cat-sub-menu">
                        <li>
                            <a href="<%=request.getContextPath()+ViewPaths.COLMENA_CREATE%>">Añadir</a>
                        </li>
                        <li>
                            <a href="">Consultar</a>
                        </li>
                    </ul>
                       
                </li>
                <li>
                    <a class="show-cat-btn" href="">
                        <span class="icon image" aria-hidden="true"></span>Evento
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            <span class="icon arrow-down" aria-hidden="true"></span>
                        </span>
                    </a>
                    <ul class="cat-sub-menu">
                        <li>
                            <a href="">Añadir</a>
                        </li>
                        <li>
                            <a href="">Consultar</a>
                        </li>
                    </ul>
                        
                </li>
                <li>
                    <a class="show-cat-btn" href="">
                        <span class="icon paper" aria-hidden="true"></span>Cosecha
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            <span class="icon arrow-down" aria-hidden="true"></span>
                        </span>
                    </a>
                    <ul class="cat-sub-menu">
                        <li>
                            <a href="">Añadir</a>
                        </li>
                        <li>
                            <a href="">Consultar</a>
                        </li>
                    </ul>
                        
                </li>
            </ul>
        </div>
    </div>
  </aside>
  <div class="main-wrapper">
    <!-- ! Main nav -->
    <nav class="main-nav--bg">
  		<div class="container main-nav">
    		<div class="main-nav-start">
      
    		</div>
    		<div class="main-nav-end">
	      	<button class="sidebar-toggle transparent-btn" title="Menu" type="button">
	        	<span class="sr-only"></span>
	        	<span class="icon menu-toggle--gray" aria-hidden="true"></span>
	      	</button>
	      
	      <!--boton de perfil(arriba derecha)-->
	        <%
	        Usuario usuario = (Usuario) SessionManager.get(request, AttributeNames.USUARIO);
	        %>
	      
	      	<div class="nav-user-wrapper">
	        <button href="##" class="nav-user-btn dropdown-btn" title="<%=usuario.getNombre()%>" type="button">
	          <span class="" style="position: relative;	float:left;margin-right: 20px;margin-top: 7px;"><%=usuario.getNombre()%></span>
	          <span class="nav-user-img">
	            <picture><source srcset="<%=request.getContextPath()%>/img/avatar/avatar-illustrated-02.webp" type="image/webp"><img src="<%=request.getContextPath()%>/img/avatar/avatar-illustrated-02.png" alt="<%=usuario.getNombre()%>"></picture>
	          </span>
	        </button>
	        <ul class="users-item-dropdown nav-user-dropdown dropdown" style="margin-top: -50px;">
	          <li><a href="<%=request.getContextPath()+ViewPaths.USER_PROFILE%>">
	              <i data-feather="user" aria-hidden="true"></i>
	              <span>Perfil</span>
	            </a></li>
	          <li><a href="<%=request.getContextPath()+ViewPaths.USER_EDIT%>">
	              <i data-feather="settings" aria-hidden="true"></i>
	              <span>Ajustes de cuenta</span>
	            </a></li>
	          <li><a class="danger" href="<%=request.getContextPath()+ControllerPaths.USER%>?action=<%=ActionNames.LOGOUT%>">
	              <i data-feather="log-out" aria-hidden="true"></i>
	              <span>Desconectarme</span>
	            </a></li>
	        </ul>
	      </div>
    </div>
  </div>
</nav>

    