<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Inicia Sesi�n</title>
    </head>
    <body>
        <a href="#top" class="link">a</a>
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
        <div id="menuPrincipal" class="mainMenu">
            <div class="menuContacto">
                <p class="tituloLogin">Inicia Sesi�n: </p>
                <form action="loginUser" method="post">
                	<p><input type="text" name="userName" placeholder="Usuario" class="loginBox"></p>
                	<p><input type="password" name="password" placeholder="Contrase�a" required minlength="6" maxlength="12" size="10" class="loginBox"></p>
                	<p><input type="submit" value="Enviar" class="loginButton"></p>
                </form>
                <p><a href="register.jsp">�A�n no estas registrado? Registate aqu�.</a></p>
            </div>
        </div>
    </body>
</html>