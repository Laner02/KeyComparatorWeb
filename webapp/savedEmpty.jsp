<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Lista de Deseados</title>
    </head>
    <body>
        <a href="profile.jsp" class="link">a</a>
        <div id="header" class="topnav">
            <!--barra superior con icono nombre buscador y usuario-->
            <a id="moreImg" href="more.jsp"><img class="hamMenu" src="./imgs/hamMenu.png"></a>
            <a href="displayHot.jsp" class="logo"><h1>KeyComparator</h1></a>
            <img class="userIcon" src="./imgs/userIcon.png" alt="iconoUsuario">            
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
            <div class="submenu_profile">
            	<p>Nada que ver aún.</p>
            	<p>Guarda keys en tu lista con el icono de estrella en la pagina de la key.</p>
            </div>
        </div>
    </body>
</html>