<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
	<!-- importamos las clases que hemos creado en sources -->
	<%@page import="sources.*" %>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Xbox</title>
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
            <a class="active" href="#">Xbox</a>
            <a href="displayPs.jsp">PlayStation</a>
            <a href="displayOfimatica.jsp">Ofimatica</a>
            <a href="displayTregalo.jsp">Tarjeta Regalo</a>
        </div>
        <div id="menuPrincipal" class="mainMenu">
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/fc6.png"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Far cry 6" class="keyTitle">Far cry 6</a>
                        <p>Far Cry 6 es un videojuego de disparos en primera persona desarrollado por Ubisoft Toronto y publicado por Ubisoft.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">3.2</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">27.05</p>
                </div>
            </div>
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/gta5.png"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=GTA V" class="keyTitle">GTA V</a>
                        <p>Grand Theft Auto V es un videojuego de acci�n-aventura de mundo abierto.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">5</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">14.09</p>
                </div>
            </div>
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/fifa22.png"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Fifa 22" class="keyTitle">Fifa 22</a>
                        <p>Juego simulador de deportes con las plantillas de futbol actuales.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">3.6</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">10.91</p>
                </div>
            </div>
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/gta5.png"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Red dead redemption 2" class="keyTitle">Red dead Redemption 2</a>
                        <p>videojuego de acci�n-aventura western basado en el drama, en un mundo abierto.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">4.7</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">21.37</p>
                </div>
            </div>
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/mfs.png"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Microsoft Flight Simulator" class="keyTitle">Microsoft Flight Simulator</a>
                        <p>Una experiencia de un jugador, que consta de varios simuladores de vuelo.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">3.9</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">45.87</p>
                </div>
            </div>
        </div>
    </body>
</html>