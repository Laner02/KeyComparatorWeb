<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
<!-- importamos las clases que hemos creado en sources -->
	<%@page import="sources.*" %>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Editar Perfil</title>
    </head>
    <body>
    	<!-- El login solo se accede una vez estas registrado -->
    	<%
    		//referencia al usuario de la sesion actual
    		User user = (User) session.getAttribute("user");
    		String userName = user.getUserName();
    		String fullName = user.getFullName();
    		String email = user.getEmail();
    		String location = user.getLocation();
    		int phoneNumber = user.getPhoneNumber();
    	%>
        <a href="profile.jsp" class="link">a</a>
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
            <div class="edit_profile">
            	<form action="editUser" method="POST">
            		<p>Nombre Completo: <input type="text" name="fullName" placeholder="<%= fullName %>" required class="regBox"></p>
                	<p>Email: <input type="text" name="email" placeholder="<%= email %>" required class="regBox"></p>
                	<p>Nombre de usuario: <input type="text" name="userName" placeholder="<%= userName %>" required class="regBox"></p>
                	<p>Contraseña: <input type="password" name="password" required minlength="6" maxlength="12" size="10" class="regBox"></p>
                	<!--Podemos hacer que repita la contraseña y revisamos si son iguales al registrar a alguien?-->
                	<p>Ubicacion: <input type="text" name="location" placeholder="<%= location %>" required class="regBox"></p>
                	<p>Telefono: <input type="text" name="phoneNumber" placeholder="<%= phoneNumber %>" required minlength="9" maxlength="9" class="regBox"></p>
                	<p><input type="submit" value="Guardar" class="regButton"> <a href="profile.jsp" class="cancel_profile">Cancelar</a></p>
            	</form>
            </div>
        </div>
    </body>
</html>