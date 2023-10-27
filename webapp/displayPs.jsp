<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
	<!-- importamos las clases que hemos creado en sources -->
	<%@page import="sources.*" %>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Play Station</title>
    </head>
    <body>
       	<%
    		//recoge los parametros del usuario desde la sesion actual
    		User user = (User) session.getAttribute("user");
			String userName = user.getUserName();
		%>
    	<!-- Desde la pagina principal les mandamos al login, y ahi se registran y ya devuelven un jsp igual a este con el nombre de usuario ya -->
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
        <div class="filters">
            <!--barra superior para los filtros-->
            <a href="displayHot.jsp">PC</a>
            <a href="displayNintendo.jsp">Nintendo</a>
            <a href="displayXbox.jsp">Xbox</a>
            <a class="active" href="#">PlayStation</a>
            <a href="displayOfimatica.jsp">Ofimatica</a>
            <a href="displayTregalo.jsp">Tarjeta Regalo</a>
        </div>
        <div id="menuPrincipal" class="mainMenu">
            <div class="menuNotFound">
                <p class="keyNotFoundText">No hay claves para esta plataforma aún.</p>
            </div>
            <img class="keyNotFoundIcon" alt="claveNoEncontrada_creditos:OnlineWebFonts" src="./imgs/keyChain.png">
         	<img class="keyNotFoundQuestion" alt="claveNoEncontrada_creditos:OnlineWebFonts" src="./imgs/questionMark.png">
        </div>
    </body>
</html>