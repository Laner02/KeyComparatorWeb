<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
	<!-- importamos las clases que hemos creado en sources -->
	<%@page import="sources.*" %>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Nueva Reseña</title>
    </head>
    <body>
    	<%
    		//recoge los parametros del usuario desde la sesion actual
    		User user = (User) session.getAttribute("user");
			String userName = user.getUserName();
			//coge la clave de la sesion que le pasa el servlet
			//hacer que cuando acceda a este jsp meta en session un atributo con el nombre "key"
            Key key = (Key) session.getAttribute("key");
			String name = key.getName();
			String image = key.getImage();
			String description = key.getDescription();
			//Eliminamos la key de la session para poder usarla de nuevo
			session.removeAttribute("key");
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
        
        <div id="reviewMenu" class="menuReview">
            <!--TODO hacer que muestre el nombre de la key pillandola arriba de la sesion y muestre la key, y luego pasar el nombre por variable para en el servlet meter en la BD la reseÃ±a a esa key en especifico-->
            <div class="tituloReview">Nueva Reseña de <%= name %>: </div>
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src=<%= image %>></div>
                    <div class="keyDesc">
                        <p><%= description %></p>
                    </div>
                </div>
            </div>
            <p class="reviewFail">Lo sentimos: Solo se permite una reseña por usuario para un mismo juego.</p>
        </div>
    </body>
</html>