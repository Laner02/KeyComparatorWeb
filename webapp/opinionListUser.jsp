<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
	<!-- importamos las clases que hemos creado en sources -->
	<%@page import="sources.*" %>
	<%@page import="java.util.ArrayList" %>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Opiniones</title>
    </head>
    <body>
    	<%
        	//recoge los paramteros del usuario desde la sesion actual
        	User user = (User) session.getAttribute("user");
    		String userName = user.getUserName();
        	//recoge la clave que se guarda en el servlet y la tienda
        	Key key = (Key) session.getAttribute("key");
        	String keyName = key.getName();
        	String keyImage = key.getImage();
        	int shopType = Integer.parseInt(session.getAttribute("shopType").toString());
        	ArrayList<Opinion> shopOpinions = key.getShops().get(shopType).getOpinions();
        	String shopName = session.getAttribute("shopName").toString();
        	String shopImage = key.getShops().get(shopType).getImage();
        	//eliminamos las variables de la sesion
        	session.removeAttribute("key");
        	session.removeAttribute("shopType");
        	session.removeAttribute("shopName");
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
            <div class="savedTitle">
                Opiniones y comentarios de <%= shopName %>
                <a href="checkUserNewOpinion?keyName=<%= keyName %>&shopName=<%= shopName %>" class="addReviewLink"><img class="addReviewIcon" src="./imgs/plusIcon.png"></a>
            </div>
            <%
            	//Un bucle para imprimir las Reviews
            	int i = 0;
            	while(i<shopOpinions.size()) {
            		//guardamos la opinion actual y guardamos sus campos
            		Opinion currentOpinion = shopOpinions.get(i);		
            		String description = currentOpinion.getDescription();
            		String opinionUserName = currentOpinion.getAuthorUserName();
            %>
            	<div class="key shadow-1">
                	<div class="keyPreview">
                    	<div class="keyImg"><img class="keyPhoto" src=<%= shopImage %>></div>
                    	<div class="keyDesc">
                        	<a class="keyTitle"><%= description %></a>
                        	<p>De: @<%= opinionUserName %></p>
                    	</div>
                	</div>
            	</div>
            <%
            	i++;
            	}
            %>
        </div>
    </body>
</html>