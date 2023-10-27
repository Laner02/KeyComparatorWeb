<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
	<!-- importamos las clases que hemos creado en sources -->
	<%@page import="sources.*" %>
	<%@page import="java.util.ArrayList" %>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Reseñas</title>
    </head>
    <body>
    	<%
        	//recoge los paramteros del usuario desde la sesion actual
        	User user = (User) session.getAttribute("user");
    		String userName = user.getUserName();
        	//recoge la clave que se guarda en el servlet
        	Key key = (Key) session.getAttribute("key");
        	String keyName = key.getName();
        	session.removeAttribute("key");		//eliminamos el atributo key para volver a usarlo
        %>
        <a href="profile.jsp" class="link">a</a>
        <div id="header" class="topnav">
            <!--barra superior con icono nombre buscador y usuario-->
            <a id="moreImg" href="checkMoreUser"><img class="hamMenu" src="./imgs/hamMenu.png"></a>
            <a href="displayHot.jsp" class="logo"><h1>KeyComparator</h1></a>
            <img class="userIcon" src="./imgs/userIcon.png" alt="iconoUsuario">
            <div class="userName"><%= userName %></div>            
            <form action="searchBarServlet" method="get">
            	<input type="image" class="glass" src="./imgs/glass.png">
            	<input type="text" name="search" placeholder="Click para buscar...">
            </form>
        </div>
        <div id="menuPrincipal" class="mainMenu_profile">
            <div class="tituloReview">
                Reseñas de <%= keyName %>
                <a href="checkUserNewReview?keyName=<%= keyName %>"><img class="addReviewIcon" src="./imgs/plusIcon.png"></a>
            </div>
            <div class="emptyKeyDescription">
                <p>Aún no hay reseñas para esta key.</p>
	            <p>Sé el primero! Añade una reseña con el icono +.</p>
            </div>
        </div>
        <img class="reviewNotFound" alt="noHayOpiniones_creditos:OnlineWebFonts" src="./imgs/noOpinion.png">
    </body>
</html>