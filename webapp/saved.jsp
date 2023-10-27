<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
	<!-- importamos las clases que hemos creado en sources -->
	<%@page import="sources.*" %>
	<%@page import="java.util.ArrayList" %>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Lista de Deseados</title>
    </head>
    <body>
    	<%
        	//recoge los paramteros del usuario desde la sesion actual
        	User user = (User) session.getAttribute("user");
    		String userName = user.getUserName();
        	ArrayList<Key> wishList = user.getWishList();
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
        <div id="menuLateral" class="sidenav_profile">
            <a href="profile.jsp">
                <img class ="sidenavPhoto_profile" src="./imgs/sidenav_profile.png">
            </a>
            <a href="#top" class="active">
                <img class ="sidenavPhoto_profile" src="./imgs/sidenav_saved.png">
            </a>
            <a href="options.jsp">
                <img class ="sidenavPhoto_profile" src="./imgs/sidenav_settings.png">
            </a>
        </div>
        <div id="menuPrincipal" class="mainMenu_profile">
            <div class="savedTitle">
                Lista de deseados
            </div>
            <%
            	//Un bucle para imprimir las Keys
            	int i = 0;
            	while(i<wishList.size()) {
            		//guardamos la clave actual y guardamos sus campos
            		Key tmpKey = wishList.get(i);
            		String name = tmpKey.getName();
            		String image = tmpKey.getImage();
            		String description = tmpKey.getDescription();
            		String score = "" + tmpKey.getScore();
            %>
            	<div class="key shadow-1">
                	<div class="keyPreview">
                    	<div class="keyImg"><img class="keyPhoto" src=<%= image %>></div>
                    	<div class="keyDesc">
                        	<a href="accessKey?name=<%= name %>" class="keyTitle"><%= name %></a>
                        	<p><%= description %></p>
                    	</div>
                	</div>
                	<div class="precio">
                    	<img class="review" src="./imgs/review3.png">
                    	<a class="valoracion"><%= score %></a>
                    	<a href="deleteKeyWishList?name=<%= name %>"><img class="binIcon" src="./imgs/binImg.png" alt="iconoEliminarKey"></a>
                    	<img class="priceWishList" src="./imgs/price2.png">
                	</div>
            	</div>
            <%
            	i++;
            	}
            %>
        </div>
    </body>
</html>