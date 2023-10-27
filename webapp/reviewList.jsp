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
        	String keyImage = key.getImage();
        	ArrayList<Review> keyReviews = key.getReviews();
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
            <div class="savedTitle">
                Reseñas de <%= keyName %>
                <a href="checkUserNewReview?keyName=<%= keyName %>" class="addReviewLink"><img class="addReviewIcon" src="./imgs/plusIcon.png"></a>
            </div>
            <%
            	//Un bucle para imprimir las Reviews
            	int i = 0;
            	while(i<keyReviews.size()) {
            		//guardamos la reseña actual y guardamos sus campos
            		Review currentReview = keyReviews.get(i);
            		String title = currentReview.getTitle();            		
            		String description = currentReview.getDescription();
            		String score = "" + currentReview.getScore();
            		String reviewUserName = currentReview.getReviewUserName();
            %>
            	<div class="key shadow-1">
                	<div class="keyPreview">
                    	<div class="keyImg"><img class="keyPhoto" src=<%= keyImage %>></div>
                    	<div class="keyDesc">
                        	<a class="keyTitle"><%= title %></a>
                        	<a class="reviewUser">De: @<%= reviewUserName %></a>
                        	<p><%= description %></p>
                    	</div>
                	</div>
                	<div class="precio">
                    	<img class="review" src="./imgs/review3.png">
                    	<a class="valoracion"><%= score %></a>
                    	<!--Hacer que esto solo lo vea el que escribe la reseña?  <a href="deleteKeyWishList?name=java_key_name"><img class="binIcon" src="./imgs/binImg.png" alt="iconoEliminarKey"></a> -->
                	</div>
            	</div>
            <%
            	i++;
            	}
            %>
        </div>
    </body>
</html>