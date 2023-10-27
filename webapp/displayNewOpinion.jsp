<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
	<!-- importamos las clases que hemos creado en sources -->
	<%@page import="sources.*" %>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Nueva Opinion</title>
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
			int shopType = Integer.parseInt(session.getAttribute("shopType").toString());
			String shopName = session.getAttribute("shopName").toString();
			String shopImage = key.getShops().get(shopType).getImage();
			String description = key.getDescription();
			//Eliminamos la key de la session para poder usarla de nuevo y el resto de variables
			session.removeAttribute("key");
			session.removeAttribute("shopType");
			session.removeAttribute("shopName");
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
            <div class="tituloReview">Nueva Opinion de <%= shopName %>: </div>
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src=<%= shopImage %>></div>
                </div>
            </div>
            <form action="submitOpinion" class="reviewText" method="get">
            	<input type="hidden" name="userName" value="<%= userName %>">	<!-- Asi se meten variables extras es un form -->
            	<input type="hidden" name="shopName" value="<%= shopName %>">
                <p><input type="text" name="reviewBody" required maxlength="300" class="bodyReview" placeholder="Escribe aqui tu reseña"></p>
                <p><input type="submit" value="Terminar"></p>
            </form>
        </div>
    </body>
</html>