<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Key no encontrada</title>
    </head>
    <body>
        <a href="login.jsp" class="link">a</a>
        <div id="header" class="topnav">
            <!--barra superior con icono nombre buscador y usuario-->
            <a id="moreImg" href="checkuserMore"><img class="hamMenu" src="./imgs/hamMenu.png"></a>
            <a href="index.jsp" class="logo"><h1>KeyComparator</h1></a>
            <img class="userIcon" src="./imgs/userIcon.png" alt="iconoUsuario">
            <form action="searchBarServlet" method="get">
            	<input type="image" class="glass" src="./imgs/glass.png">
            	<input type="text" name="search" placeholder="Click para buscar...">
            </form>
        </div>
        <div id="menuPrincipal" class="mainMenu">
            <div class="menuNotFound">
                <p class="keyNotFoundText">No se ha encontrado la Key, prueba a buscar de nuevo.</p>
            </div>
            <img class="keyNotFoundIcon" alt="claveNoEncontrada_creditos:OnlineWebFonts" src="./imgs/keyChain.png">
         	<img class="keyNotFoundQuestion" alt="claveNoEncontrada_creditos:OnlineWebFonts" src="./imgs/questionMark.png">
        </div>
    </body>
</html>