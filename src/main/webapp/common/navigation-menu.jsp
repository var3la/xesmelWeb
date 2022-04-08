
 <div class="layer"></div>
<!-- ! Body -->
<a class="skip-link sr-only" href="#skip-target">Skip to content</a>
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
                <span class="sr-only">Toggle menu</span>
                <span class="icon menu-toggle" aria-hidden="true"></span>
            </button>
        </div>
        <div class="sidebar-body">
            <ul class="sidebar-body-menu">
                <li>
                    <a class="active" href="<%=request.getContextPath()%>/user"><span class="icon home" aria-hidden="true"></span>Menú Principal</a>
                </li>
                <li>
                    <a class="show-cat-btn" href="<%=request.getContextPath()%>/apiario/apiario-search.jsp">
                        <span class="icon document" aria-hidden="true"></span>Apiario
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            
                        </span>
                    </a>
                    
                </li>
                <li>
                    <a class="show-cat-btn" href="<%=request.getContextPath()%>/colmena/colmena-search.jsp">
                        <span class="icon folder" aria-hidden="true"></span>Colmena
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            
                        </span>
                    </a>
                    
                </li>
                <li>
                    <a class="show-cat-btn" href="<%=request.getContextPath()%>/evento/evento-search.jsp">
                        <span class="icon image" aria-hidden="true"></span>Evento
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            
                        </span>
                    </a>
                    
                </li>
                <li>
                    <a class="show-cat-btn" href="<%=request.getContextPath()%>/cosecha/cosecha-search.jsp">
                        <span class="icon paper" aria-hidden="true"></span>Cosecha
                        <span class="category__btn transparent-btn" title="Open list">
                            <span class="sr-only">Open list</span>
                            
                        </span>
                    </a>
                    
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
        <span class="sr-only">Toggle menu</span>
        <span class="icon menu-toggle--gray" aria-hidden="true"></span>
      </button>
      
      <!--boton de perfil(arriba derecha)-->
        <%
        Usuario usuario = (Usuario) SessionManager.get(request, AttributeNames.USUARIO);
        %>
        <span class="top"><p><%=usuario.getNombre()%></p></span>
      
      <div class="nav-user-wrapper">
        <button href="##" class="nav-user-btn dropdown-btn" title="My profile" type="button">
          <span class="sr-only">Mi perfil</span>
          <span class="nav-user-img">
            <picture><source srcset="<%=request.getContextPath()%>/img/avatar/avatar-illustrated-02.webp" type="image/webp"><img src="<%=request.getContextPath()%>/img/avatar/avatar-illustrated-02.png" alt="User name"></picture>
          </span>
        </button>
        <ul class="users-item-dropdown nav-user-dropdown dropdown">
          <li><a href="<%=request.getContextPath()%>/user/user-results.jsp">
              <i data-feather="user" aria-hidden="true"></i>
              <span>Perfil</span>
            </a></li>
          <li><a href="<%=request.getContextPath()%>/user/user-search.jsp">
              <i data-feather="settings" aria-hidden="true"></i>
              <span>Ajustes de cuenta</span>
            </a></li>
          <li><a class="danger" href="<%=request.getContextPath()%>/user/logout.jsp">
              <i data-feather="log-out" aria-hidden="true"></i>
              <span>Desconectarme</span>
            </a></li>
        </ul>
      </div>
    </div>
  </div>
</nav>
    <!-- ! Main -->
    <main class="main users chart-page" id="skip-target">
      <div class="container">
        <h2 class="main-title">Resultados</h2>
        	
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