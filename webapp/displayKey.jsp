<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
	<!-- importamos las clases que hemos creado en sources -->
	<%@page import="sources.*" %>
	<%@page import="java.util.ArrayList" %>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>KeyComparator - Clave</title>
    </head>
    <body>
    	<%
    		//recoge los parametros de la session con el nombre del juego y del usuario
    		Key key = (Key) session.getAttribute("currentKey");
    		String keyName = key.getName();
    		String keyImage = key.getImage();
    		String keyDescription = key.getDescription();
    		String keyScore = "" + key.getScore();
    		String price = "" + key.getPrice();				//este es el precio MINIMO
    		ArrayList<Tags> tags = key.getTags();
    		ArrayList<Shop> keyShops = key.getShops();
    		session.removeAttribute("currentKey");
    	%>
        <a href="login.jsp" class="link">a</a>
        <div id="header" class="topnav">
            <!--barra superior con icono nombre buscador y usuario-->
            <a id="moreImg" href="checkUserMore"><img class="hamMenu" src="./imgs/hamMenu.png"></a>
            <a href="index.jsp" class="logo"><h1>KeyComparator</h1></a>
            <img class="userIcon" src="./imgs/userIcon.png" alt="iconoUsuario">
            <form action="searchBarServlet" method="get">
                <input type="image" class="glass" src="./imgs/glass.png">
                <input type="text" name="search" placeholder="Click para buscar...">
            </form>
        </div>
        <div class="mainMenu">
            <img class="keyImage" src=<%= keyImage %> alt="Juego<%= keyName %>">
            <h1 class="centrar">
                <%= keyName %>
            </h1>
            <div class="centrarTexto">
                <p><%= keyDescription %></p>
            </div>
            <h2 class="centrarValoracion">
                <%= keyScore %>
            </h2>
            <a href="checkUser?name=<%= keyName %>"><img class="centrarEstrella" src="./imgs/review3.png" alt="Valoracion"></a>
            <h3 class="centrarTiposJuego">
            	<%
            		//un bucle que va imprimiendo etiquetas de una key
            		int i = 0;
            		while(i<tags.size()) {
            	%>
                	<div class="etiqueta"><%= tags.get(i) %></div>
                <%
                	i++;
            		}
                %>
            </h3>
        </div>
        <div id="SaveAndReview" class="saveAndReview">
        	<p><a href="checkUser?name=<%= keyName %>"><img class="saveIcon" src="./imgs/heart.png" alt="IconoParaGuardarEnDeseados"></a></p>
        	<p><a href="checkUserReview?name=<%= keyName %>"><img class="commentIcon" src="./imgs/comment.png" alt="ComentariosDelJuego"></a></p>
        </div>
        <div id="TablaPrecios" class="divTable">
            <table id="Tabla1" class="table1">
                <tr>
                    <th class="cabeceraTienda">Tienda</th>
                    <th class="cabeceraTabla">Plataforma</th>
                    <th class="cabeceraTabla">Comentarios</th>
                    <th class="cabeceraTabla">Precio</th>
                </tr>
                <tr>
                    <td><a href="<%= keyShops.get(0).getLink() %>"><img class="imgtable1" src="./imgs/gamivo.png"></a></td>
                    <td><a href="https://help.steampowered.com/en/faqs/view/2A12-9D79-C3D7-F870"><img class="imgtable2" src="./imgs/steam.png"></a></td>
                    <td><a href="checkUserOpinion?keyName=<%= keyName%>&shop=0"><img class="imgtable3" src="./imgs/comment.png"></a></td>
                    <td><%= keyShops.get(0).getPrice() %> €</td>
                </tr>
                <tr>
                    <td><a href="<%= keyShops.get(1).getLink() %>"><img class="imgtable1" src="./imgs/eneba.png"></a></td>
                    <td><a href="https://help.steampowered.com/en/faqs/view/2A12-9D79-C3D7-F870"><img class="imgtable2" src="./imgs/steam.png"></a></td>
                    <td><a href="checkUserOpinion?keyName=<%= keyName%>&shop=1"><img class="imgtable3" src="./imgs/comment.png"></a></td>
                    <td><%= keyShops.get(1).getPrice() %> €</td>
                </tr>
                <tr>
                    <td><a href="<%= keyShops.get(2).getLink() %>"><img class="imgtable1" src="./imgs/igaming.png"></a></td>
                    <td><a href="https://help.steampowered.com/en/faqs/view/2A12-9D79-C3D7-F870"><img class="imgtable2" src="./imgs/steam.png"></a></td>
                    <td><a href="checkUserOpinion?keyName=<%= keyName%>&shop=2"><img class="imgtable3" src="./imgs/comment.png"></a></td>
                    <td><%= keyShops.get(2).getPrice() %> €</td>
                </tr>
            </table>
        </div>
    </body>
</html>