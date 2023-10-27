<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Nintendo</title>
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
            <a class="active" href="#">Nintendo</a>
            <a href="xbox.jsp">Xbox</a>
            <a href="ps.jsp">PlayStation</a>
            <a href="ofimatica.jsp">Ofimatica</a>
            <a href="tregalo.jsp">Tarjeta Regalo</a>
        </div>
        <div id="menuPrincipal" class="mainMenu">
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/kirbylost.jpg"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Kirby y la tierra olvidada" class="keyTitle">Kirby y la Tierra olvidada</a>
                        <p>Únete a Kirby en una inolvidable aventura de plataformas en 3D a través de un misterioso nuevo mundo.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">4.6</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">46.00</p>
                </div>
            </div>
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/pokemonLeyendasArceus.png"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Leyendas Pokemon Arceus" class="keyTitle">Leyendas Pokemon Arceus</a>
                        <p>Leyendas Pokémon: Arceus es un videojuego de rol de acción desarrollado por Game Freak y publicado por The Pokémon Company y Nintendo para Nintendo Switch.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">3.5</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">40.00</p>
                </div>
            </div>
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/switchSports.png"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Nintendo Switch Sports" class="keyTitle">Nintendo Switch Sports</a>
                        <p>Nintendo Switch Sports es un videojuego de simulación de deportes desarrollado y publicado por Nintendo para Nintendo Switch.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">4.5</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">37.99</p>
                </div>
            </div>
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/justdance2022.png"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Just Dance 2022" class="keyTitle">Just Dance 2022</a>
                        <p>Just dance 2022 es un juego recreacional de baile desarrollado por Ubisoft.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">3</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">17.89</p>
                </div>
            </div>
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/botw.png"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Zelda breath of the wild" class="keyTitle">Zelda breath of the wild</a>
                        <p>Trepidante juego de aventura de la franquicia Zelda. Embarcate en un aventura en solitario como Link.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">4.9</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">40.00</p>
                </div>
            </div>
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/littlenightmares.png"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Little Nightmares" class="keyTitle">Little Nightmares</a>
                        <p>Little Nightmares es un videojuego de rompecabezas y horror de supervivencia.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">4.1</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">15.07</p>
                </div>
            </div>
        </div>
    </body>
</html>