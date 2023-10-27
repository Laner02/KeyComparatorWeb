<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
	<!-- importamos las clases que hemos creado en sources -->
	<%@page import="sources.*" %>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Ofertas</title>
    </head>
    <body>
    	<%
    		//referencia al usuario de la sesion actual
			User user = (User) session.getAttribute("user");
			String userName = user.getUserName();
    	%>
        <a href="profile.jsp" class="link">a</a>
        <div id="header" class="topnav">
            <!--barra superior con icono nombre buscador y usuario-->
            <a id="moreImg" href="checkUserMore"><img class="hamMenu" src="./imgs/hamMenu.png"></a>
            <a href="#top" class="logo"><h1>KeyComparator</h1></a>
            <img class="userIcon" src="./imgs/userIcon.png" alt="iconoUsuario">
            <div class="userName"><%= userName %></div>
            <form action="searchBarServlet" method="get">
            	<input type="image" class="glass" src="./imgs/glass.png">
            	<input type="text" name="search" placeholder="Click para buscar...">
            </form>
        </div>
        <div class="filters">
            <!--barra superior para los filtros-->
            <a class="active" href="#home">PC</a>
            <a href="displayNintendo.jsp">Nintendo</a>
            <a href="displayXbox.jsp">Xbox</a>
            <a href="displayPs.jsp">PlayStation</a>
            <a href="displayOfimatica.jsp">Ofimatica</a>
            <a href="displayTregalo.jsp">Tarjeta Regalo</a>
        </div>
        <div id="menuLateral" class="sidenav">
            <!--Los # son las URL a las que te llevan los link, deberan ser los de las paginas que hagamos-->
            <a href="displayHot.jsp"><img class="sidenavPhoto" src="./imgs/hotKeys.png" alt="Tendencia"></a>
            <a href="#top" class="active"><img class="sidenavPhoto" src="./imgs/offer.png" alt="Ofertas"></a>
            <a href="displayTopReview.jsp"><img class="sidenavPhoto" src="./imgs/topValorados.png" alt="TopValor"></a>
            <a href="displayNewKeys.jsp"><img class="sidenavPhoto" src="./imgs/nuevo.png" alt="Nuevos"></a>
        </div>
        <div id="menuPrincipal" class="mainMenu">
        	<div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/loophero.jpg"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Loop Hero" class="keyTitle">Loop Hero</a>
                        <p>Loop hero es un RPG sin fin, un roguelite en el que un lich malvado ha destruido la realidad y todo lo que contiene.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">4.2</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">5.94</p>
                </div>
            </div>
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/terraria.jpg"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Terraria" class="keyTitle">Terraria</a>
                        <p>Terraria es un juego sandbox de exploración 2D en el que el jugador busca diseñar el mundo de acuerdo a sus propias elecciones y sus habilidades en combate, elaboración y recolección de recursos.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">4.7</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">5.94</p>
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
                        <a href="accessKey?name=GTA V" class="keyTitle">GTA V</a>
                        <p>Grand Theft Auto V es un videojuego de acción-aventura de mundo abierto.</p>
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
            <div class="key shadow-1">
                <div class="keyPreview">
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/rdr2.png"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Red dead redemption 2" class="keyTitle">Red dead Redemption 2</a>
                        <p>Videojuego de acción-aventura western basado en el drama, en un mundo abierto.</p>
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
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/win_11.png"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Windows 11" class="keyTitle">Windows 11</a>
                        <p>Windows 11 el nuevo sistema operativo de Microsoft, la versión Pro™ incluye todas las características de Home al tiempo que añade características adicionales, principalmente para entornos profesionales.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">3.4</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">45.87</p>
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
                    <div class="keyImg"><img class="keyPhoto" src="./imgs/eldenring.jpg"></div>
                    <div class="keyDesc">
                        <a href="accessKey?name=Elden Ring" class="keyTitle">Elden Ring</a>
                        <p>Elden Ring es un RPG de accion, escrito por George RR Martin (creador de juego de tronos), y Hidetaka Miyazaki, de otros titulos como sekiro, dark souls o bloodborne.</p>
                    </div>
                </div>
                <div class="precio">
                    <img class="review" src="./imgs/review3.png">
                    <a class="valoracion">4.5</a>
                    <img class="price" src="./imgs/price2.png">
                    <p class="minPrice">43.39</p>
                </div>
            </div>
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