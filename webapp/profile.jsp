<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
	<!-- importamos las clases que hemos creado en sources -->
	<%@page import="sources.*" %>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Perfil Usuario</title>
    </head>
    <body>
    	<!-- El login solo se accede una vez estas registrado -->
    	<%
    		//referencia al usuario de la sesion actual
    		User user = (User) session.getAttribute("user");
    		String userName = user.getUserName();
    		//pillamos solo la longitud de la contraseña, no la contraseña
    		String passwordLen = "" + user.getPasswordLength();
    		String fullName = user.getFullName();
    		String email = user.getEmail();
    		String location = user.getLocation();
    		String phoneNumber = "" + user.getPhoneNumber();
    		String reviewNumber = "" + user.getReviewNumber();
    	%>
        <a href="#top" class="link">a</a>
        <div id="header" class="topnav">
            <!--barra superior con icono nombre buscador y usuario-->
            <a id="moreImg" href="checkUserMore"><img class="hamMenu" src="./imgs/hamMenu.png"></a>
            <a href="displayHot.jsp" class="logo"><h1>KeyComparator</h1></a>
            <img class="userIcon" src="./imgs/userIcon.png" alt="iconoUsuario">
            <div class="userName"><%= userName %></div>            
            <form action="searchBarServlet" method="get">
            	<input type="image" class="glass" src="./imgs/glass.png">
            	<input type="text" name="search" placeholder="Click para buscar...">
            </form>
        </div>
        <div id="menuLateral" class="sidenav_profile">
            <a href="#top" class =active>
                <img class ="sidenavPhoto_profile" src="./imgs/sidenav_profile.png">
            </a>
            <a href="checkWishList">	<!-- Comprueba la wishlist del usuario -->
                <img class ="sidenavPhoto_profile" src="./imgs/sidenav_saved.png">
            </a>
            <a href="options.jsp">
                <img class ="sidenavPhoto_profile" src="./imgs/sidenav_settings.png">
            </a>
        </div>
        <div id="menuPrincipal" class="mainMenu_profile">
            <img class="image_profile" src="./imgs/profile.jpg" alt="Imagen de perfil por defecto">      
            <div class="nombre_profile"><%= fullName %></div>
            <div class="mail_profile"><%= email %></div>
            <div class="sub_profile">
                <p>Usuario: <%= userName %></p>
                <p>Contraseña: ********</p>	<!-- La contraseña me gustaria hacerla con un bucle que imprima asteriscos pero no funciona -->
                <p>Ubicacion: <%= location %></p>
                <p>Telefono: <%= phoneNumber %></p>
                <p>Reseñas: <%= reviewNumber %></p>
                
                <div class="logout_profile">
                	<a href="logout">Cerrar Sesión</a>
                </div>
            </div>
            <!-- TODO HACER UN SERVLET QUE NOS LLEVE A UN JSP COMO EL DE REGISTRO PARA MODIFICAR EL PERFIL Y CAMBIAR LOS ATRIBUTOS -->
            <div class="editar_profile"><a href="editProfile.jsp">Editar</a></div>
        </div>
    </body>
</html>