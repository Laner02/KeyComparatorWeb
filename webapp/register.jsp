<!--autor: grupo 26-->
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css">        <!--Metemos la referencia al CSS, en una variable llamada stylesheet-->
        <title>KeyComparator - Registrate</title>
    </head>
    <body>
        <a href="login.jsp" class="link">a</a>
        <div id="header" class="topnav">
            <!--barra superior con icono nombre buscador y usuario-->
            <a id="moreImg" href="#top"><img class="hamMenu" src="./imgs/hamMenu.png"></a>
            <a href="index.jsp" class="logo"><h1>KeyComparator</h1></a>
            <img class="userIcon" src="./imgs/userIcon.png" alt="iconoUsuario">
            <form action="searchBarServlet" method="get">
            	<input type="image" class="glass" src="./imgs/glass.png">
            	<input type="text" name="search" placeholder="Click para buscar...">
            </form>
        </div>
        <div id="menuPrincipal" class="mainMenu">
            <div class="menuContacto">
                <p class="tituloLogin">Nuevo Usuario: </p>
                <form action="registerUser" method="POST">
                	<p><input type="text" name="fullName" placeholder="Nombre Completo" required class="regBox"></p>
                	<p><input type="text" name="email" placeholder="Correo electr�nico" required class="regBox"></p>
                	<p><input type="text" name="userName" placeholder="Nombre Usuario" required class="regBox"></p>
                	<p><input type="password" name="password" placeholder="Contrase�a" required minlength="6" size="10" class="regBox"></p>
                	<!--Podemos hacer que repita la contrase�a y revisamos si son iguales al registrar a alguien?-->
                	<p><input type="text" name="location" placeholder="Ubicaci�n" required class="regBox"></p>
                	<p><input type="text" name="phoneNumber" placeholder="Numero de tel�fono" required minlength="9" maxlength="9" class="regBox"></p>
                	<p><input type="submit" value="Registrate" class="regButton"></p>
                </form>
                <p><a href="login.jsp">�Ya tienes una cuenta? Inicia sesi�n aqu�.</a></p>
            </div>
        </div>
    </body>
</html>