<!doctype html>
<%@page import="com.jorge.xesmel.web.controller.utils.*"%>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>Xesmel (Gesti?n explotaciones ap?colas)</title>

        <!-- CSS FILES -->
        <link rel="preconnect" href="https://fonts.googleapis.com">

        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@100;300;400;700;900&display=swap" rel="stylesheet">

        <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/css/bootstrap-icons.css" rel="stylesheet">

        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/magnific-popup.css">

        <link href="<%=request.getContextPath()%>/css/aos.css" rel="stylesheet">

        <link href="<%=request.getContextPath()%>/css/templatemo-nomad-force.css" rel="stylesheet">

        <link rel="shortcut icon" href="<%=request.getContextPath()%>/img/logo/bee.png" type="image/x-icon">
<!--

TemplateMo 567 Nomad Force

https://templatemo.com/tm-567-nomad-force

-->
    </head>
    
    <body>
    
        <main>

            <section class="hero" id="hero">
                <div class="heroText">
                    <h1 class="text-white mt-5 mb-lg-4" data-aos="zoom-in" data-aos-delay="800">
                        XesmeL
                    </h1>
                </div>

                <div class="videoWrapper">
                    <video autoplay="" loop="" muted="" class="custom-video" poster="videos/Bee - 39116_Moment.jpg">
                        <source src="videos/Bee - 39116.mp4" type="video/mp4">

                        Your browser does not support the video tag.
                    </video>
                </div>

                <div class="overlay"></div>
            </section>

            <nav class="navbar navbar-expand-lg bg-light shadow-lg">
                <div class="container">
                    <a class="navbar-brand" href="indexHome.jsp">
                        <img class="imgLogo" src="img/logo/bee.png">
                    </a>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav mx-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#hero">Inicio</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="#about">Sobre nosotros</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="#portfolio">Que ofrecemos</a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link" href="#contact">Contacto</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="<%=request.getContextPath()+ControllerPaths.USUARIO%>/login.jsp" target="_blank">?rea privada</a>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </nav>

            <section class="section-padding pb-0" id="about">
                <div class="container mb-5 pb-lg-5">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="mb-3" data-aos="fade-up">?C?mo surge Xesmel?</h2>
                        </div>

                        <div class="col-lg-6 col-12 mt-3 mb-lg-5">
                            <p class="me-4" data-aos="fade-up" data-aos-delay="300">La Ribeira Sacra es una zona con una gran tradici?n mielera y 
                            nuestra intenci?n es facilitarles la labor a estos artesanos.
                            </p>
                        </div>

                        <div class="col-lg-6 col-12 mt-lg-3 mb-lg-5">
                            <p data-aos="fade-up" data-aos-delay="500"></p>
                        </div>

                    </div>
                </div>

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-3 col-12 p-0">      
                            <img src="<%=request.getContextPath()%>/img/beeandflower.jpg" class="img-fluid about-image" alt="">
                        </div>

                        <div class="col-lg-3 col-12 bg-dark">  
                            <div class="d-flex flex-column flex-wrap justify-content-center h-100 py-5 px-4 pt-lg-4 pb-lg-0">
                                <h3 class="text-white mb-3" data-aos="fade-up">Gestiona de forma sencilla tus apiarios</h3>

                                <p class="text-secondary-white-color" data-aos="fade-up">Podr?s llevar un control de gesti?n y producci?n.</p>
     
                            </div>
                        </div>

                        <div class="col-lg-6 col-12 p-0">  
                            <section id="myCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="<%=request.getContextPath()%>/img/apiario.jpg" class="img-fluid team-image" alt="">
                                                       


                                    </div>

                                    <div class="carousel-item">
                                        <img src="<%=request.getContextPath()%>/img/apiario0202.jpg" class="img-fluid team-image" alt="">

                                        
                                    </div>

                                    <div class="carousel-item">
                                        <img src="<%=request.getContextPath()%>/img/bee0202.jpg" class="img-fluid team-image" alt="">

                                        
                                    </div>

                                    <div class="carousel-item">
                                        <img src="<%=request.getContextPath()%>/img/bee-colonies.jpg" class="img-fluid team-image" alt="">

                                        
                                    </div>

                                    <div class="carousel-item">
                                        <img src="<%=request.getContextPath()%>/img/honeycomb.jpg" class="img-fluid team-image" alt="">

                                        
                                    </div>
                                </div>

                                <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>

                                      <span class="visually-hidden">Previous</span>
                                </button>

                                <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                                      <span class="carousel-control-next-icon" aria-hidden="true"></span>

                                      <span class="visually-hidden">Next</span>
                                </button>
                            </section>

                        </div>
                    </div>
                </div>
            </section>

            <section class="section-padding" id="portfolio">
                <div class="container">
                    <div class="row">

                        <div class="col-12">
                            <h2 class="mb-5 text-center" data-aos="fade-up">Portfolio</h2>
                        </div>

                        <div class="col-lg-6 col-12">
                            <div class="portfolio-thumb mb-5" data-aos="fade-up">
                                <a href="<%=request.getContextPath()%>/img/pant/menuinicio.jpg" class="image-popup">
                                    <img src="<%=request.getContextPath()%>/img/pant/menuinicio.jpg" class="img-fluid portfolio-image" alt="">
                                </a>

                                <div class="portfolio-info">                     
                                    <h4 class="portfolio-title mb-0">Men? inicio</h4>

                                    <p class="text-danger">F?cil e intuitivo</p>
                                </div>
                            </div> 

                            <div class="portfolio-thumb" data-aos="fade-up">
                                <a href="<%=request.getContextPath()%>/img/pant/edicionperfil.jpg" class="image-popup">
                                    <img src="<%=request.getContextPath()%>/img/pant/edicionperfil.jpg" class="img-fluid portfolio-image" alt="">
                                </a>

                                <div class="portfolio-info">                     
                                    <h4 class="portfolio-title mb-0">Consulta y edita tu perfil</h4>

                                    <p class="text-success">Podr?s cambiar y actualizar tus datos</p>
                                </div>
                            </div> 
                        </div>

                        <div class="col-lg-6 col-12">
                            <div class="portfolio-thumb mt-5 mt-lg-0 mb-5" data-aos="fade-up">
                                <a href="<%=request.getContextPath()%>/img/pant/registro.jpg" class="image-popup">
                                    <img src="<%=request.getContextPath()%>/img/pant/registro.jpg" class="img-fluid portfolio-image" alt="">
                                </a>

                                <div class="portfolio-info">                     
                                    <h4 class="portfolio-title mb-0">Registro</h4>

                                    <p class="text-info">Crea de forma sencilla tus apiarios y colmenas</p>
                                </div>
                            </div> 

                            <div class="portfolio-thumb" data-aos="fade-up">
                                <a href="<%=request.getContextPath()%>/img/pant/resultados.jpg" class="image-popup">
                                    <img src="<%=request.getContextPath()%>/img/pant/resultados.jpg" class="img-fluid portfolio-image" alt="">
                                </a>

                                <div class="portfolio-info">                     
                                    <h4 class="portfolio-title mb-0">Resultados</h4>

                                    <p class="text-warning">Muestra los datos de tu explotaci?n</p>
                                </div>
                            </div> 
                        </div>

                    </div>
                </div>
            </section>

            
            <section class=" contact section-padding" id="contact">
                <div class="container">
                    <div class="row">
                        
                        <div class="col-lg-7 col-12 mx-auto">

                            <h3 class="mb-4 text-center" data-aos="fade-up">Quieres saber m?s sobre nosotros o tienes alguna sugerencia...</h3>

                            <form action="<%=request.getContextPath()+ControllerPaths.USUARIO%>" method="post" class="contact-form" role="form" data-aos="fade-up">
								<input type="hidden" name="<%=ParameterNames.ACTION%>" value="<%=ActionNames.CONTACT_US%>">
                                <div class="row">
                                    
                                    <div class="col-lg-6 col-6">
                                        <label for="name" class="form-label">Nombre <sup class="text-danger">*</sup></label>

                                        <input type="text" name="<%=ParameterNames.USER_NAME %>" id="name" class="form-control" placeholder="Nombre completo" required>
                                    </div>

                                    <div class="col-lg-6 col-6">
                                        <label for="email" class="form-label">Email <sup class="text-danger">*</sup></label>

                                        <input type="email" name="<%=ParameterNames.EMAIL %>" id="email" pattern="[^ @]*@[^ @]*" class="form-control" placeholder="Direcci?n Email" required>
                                    </div>

                                    <div class="col-12 my-4">
                                        <label for="message" class="form-label"></label>

                                        <textarea name="<%=ParameterNames.MENSAJE %>" rows="6" class="form-control" id="message" placeholder="Cuentanos un poco..." required></textarea>
                                        
                                    </div>

                                </div>

                                <div class="col-lg-5 col-12 mx-auto mt-5">
                                    <button type="submit" class="form-control">Enviar</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </main>

        <footer class="site-footer">
            <div class="container">
                <div class="row">

                    <div class="col-12">
                        <h5 class="text-white">
                            <i class="bi-geo-alt-fill me-2"></i>
                            Chantada, Lugo
                        </h5>

                        <a href="mailto:xesmelapp@gmail.com" class="custom-link mt-3 mb-5">
                            info@xesmel.com
                        </a>
                    </div>

                    <div class="col-6">
                        <p class="copyright-text mb-0">Copyright ? XesmeL 2022 
                        
                        <br><br>Design: <a href="#" target="_parent">XesmeL</a></p>
                    
                    </div>

                    <div class="col-lg-3 col-5 ms-auto">
                        <ul class="social-icon">
                            <li><a href="#" class="social-icon-link bi-facebook"></a></li>

                            <li><a href="#" class="social-icon-link bi-twitter"></a></li>

                            <li><a href="#" class="social-icon-link bi-whatsapp"></a></li>

                            <li><a href="#" class="social-icon-link bi-instagram"></a></li>

                            <li><a href="#" class="social-icon-link bi-youtube"></a></li>
                        </ul>
                    </div>

                </div>
            </section>
        </footer>

        <!-- JAVASCRIPT FILES -->
        <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.sticky.js"></script>
        <script src="<%=request.getContextPath()%>/js/aos.js"></script>
        <script src="<%=request.getContextPath()%>/js/jquery.magnific-popup.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/magnific-popup-options.js"></script>
        <script src="<%=request.getContextPath()%>/js/scrollspy.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/custom.js"></script>

    </body>
</html>