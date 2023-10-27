<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
	<!-- importamos las clases que hemos creado en sources -->
	<%@page import="sources.*" %>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Ofimatica</title>
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
            <a href="displayPs.jsp">PlayStation</a>
            <a class="active" href="#">Ofimatica</a>
            <a href="displayTregalo.jsp">Tarjeta Regalo</a>
        </div>
        <div id="menuPrincipal" class="mainMenu">
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/win_11.png"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Windows 11" class="keyTitle">Windows 11</a>
                        <p>Windows 11 el nuevo sistema operativo de Microsoft, la versión Pro™ incluye todas las características de Home al tiempo que añade características adicionales, principalmente para entornos profesionales.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">3.4</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">39.00</p>
                </div>
            </div>
        </div>
    </body>
</html>