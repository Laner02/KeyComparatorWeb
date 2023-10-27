<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Tarjetas Regalo</title>
    </head>
    <body>
    	<!-- Desde la pagina principal les mandamos al login, y ahi se registran y ya devuelven un jsp igual a este con el nombre de usuario ya -->
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
        <div class="filters">
            <!--barra superior para los filtros-->
            <a href="index.jsp">PC</a>
            <a href="nintendo.jsp">Nintendo</a>
            <a href="xbox.jsp">Xbox</a>
            <a href="ps.jsp">PlayStation</a>
            <a href="ofimatica.jsp">Ofimatica</a>
            <a class="active" href="#">Tarjeta Regalo</a>
        </div>
        <div id="menuPrincipal" class="mainMenu">
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/lolcard.jpeg"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=League of Legends giftcard" class="keyTitle">Tarjeta regalo League of Legends 20€</a>
                        <p>Tarjeta regalo de League of Legends de 20 euros canjeable en el launcher de League of Legends.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">1.4</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">20.00</p>
                </div>
            </div>
        </div>
    </body>
</html>