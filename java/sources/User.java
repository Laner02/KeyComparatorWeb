package sources;

import java.util.ArrayList;

/**
 * Clase que modela la funcionalidad de un Usuario Registrado de la aplicaci�n web KeyComparator
 * @author Raul Villa
 */
public class User {

    private String userName;        //nombre de usuario
    private String password;        //contrase�a del usuario, no deberia tener un metodo ge, solo poder compararla con una externa que reciba el metodo
    private String fullName;        //nombre completo del usuario
    private String email;           //correo electronico
    private String location;        //ubicacion (pais)
    private int phoneNumber;        //numero de telefono
    private int reviewNumber;       //numero de rese�as del usuario
    private final boolean admin;    //boolean que indica si es admin o no el usuario

    private ArrayList<Key> wishList;//lista de deseados del usuario

    /**
     * Constructor para un Usuario que no es administrador de la aplicaci�n web.
     * La contrase�a no podra tener menos de 6 caracteres, y el correo deber� ser uno v�lido,
     * siendo v�lido un correo electr�nico que contenga un '@' y un '.'.
     * @param userName Nombre de usuario
     * @param password Contrase�a del usuario
     * @param fullName Nombre y apellidos del usuario
     * @param email Correo electronico del usuario
     * @param location Ubicacion/pais del usuario
     * @param phoneNumber Numero de telefono del usuario
     * @throws IllegalArgumentException Cuando la contrase�a tiene menos de 6 caracteres de longitud.
     * @throws IllegalArgumentException Cuando el correo electr�nico no es v�lido como se indica anteriormente.
     */
    public User(String userName, String password, String fullName, String email, String location, int phoneNumber) {
    	setUserName(userName);
        setPassword(password);
        setFullName(fullName);
        setEmail(email);
        setLocation(location);
        setPhoneNumber(phoneNumber);
        reviewNumber = 0;                   //inicializamos las rese�as realizadas a 0
        admin = false;
        wishList = new ArrayList<Key>();    //La lista de claves se inicializa vacia
    }

    /**
     * Constructor para un Usuario admin, que podemos crear nada mas acceder por primera vez a la pagina
     * o tenerlo ya en la base de datos?
     * No meto el numero de telefono para que no tenga los mismos parametros que el otro constructor
     * @param userName Nombre de usuario
     * @param password Contrase�a del usuario
     * @param fullName Nombre y apellidos del usuario
     * @param email Correo electronico del usuario
     * @param location Ubicacion/pais del usuario
     * @throws IllegalArgumentException Cuando la contrase�a tiene menos de 6 caracteres de longitud.
     * @throws IllegalArgumentException Cuando el correo electr�nico no es v�lido como se indica anteriormente.
     */
    public User(String userName, String password, String fullName, String email, String location) {
        setUserName(userName);
        setPassword(password);
        setFullName(fullName);
        setEmail(email);
        setLocation(location);
        this.phoneNumber = 0;
        reviewNumber = 0;                   //inicializamos las rese�as realizadas a 0
        admin = true;                       //el usuario es admin
        wishList = new ArrayList<Key>();    //La lista de claves se inicializa vacia
    }

    /**
     * Consulta el nombre de usuario.
     * @return String con el nombre del usuario registrado.
     */
    public String getUserName() {
        return userName;
    }

    /**
     * Modifica el nombre de usuario.
     * @param userName Nuevo nombre de usuario.
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    //hay forma de no hacerla publica?? con hashcode??
    public String getPassword() {
        return password;
    }
    
    /**
     * Modifica la contrase�a del usuario por la recibida.
     * La contrase�a tendr� un minimo de 6 caracteres.
     * @param password Nueva contrase�a.
     * @throws IllegalArgumentException Cuando la contrase�a tiene menos de 6 caracteres de longitud.
     */
    public void setPassword(String password) {
    	if (password.length() < 6) {
    		throw new IllegalArgumentException("La contrase�a no puede tener menos de 6 caracteres de longitud.");
    	}
    	this.password = password;
    }
    
    /**
     * Consulta la longitud del campo de la contrase�a, para imprimirla con asteriscos en el perfil.
     * @return Entero con la longitud de la contrase�a.
     */
    public int getPasswordLength() {
    	return getPassword().length();
    }

    /**
     * Comprueba si la contrase�a recibida es igual que la del usuario.
     * @param password Contrase�a a comprobar.
     * @return True si ambas son iguales, false si no lo son.
     */
    public boolean comparePassword(String password) {
        boolean check = false;
        if (this.password.equals(password))
            check = true;
        return check;
    }

    /**
     * Consulta el nombre completo del usuario.
     * Compuesto de nombre y apellidos normalmente.
     * @return String con el nombre y apellidos del usuario
     */
    public String getFullName() {
        return fullName;
    }

    /**
     * Modifica el nombre completo del usuario.
     * @param fullName Nuevo nombre completo del usuario.
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    /**
     * Consulta el correo electr�nico actual del usuario.
     * @return El correo electr�nico del usuario.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Modifica el correo electr�nico del usuario.
     * El correo recibido debe ser v�lido, conteniendo al menos un '@' y un '.'.
     * @param email Nuevo correo electr�nico del usuario.
     * @throws IllegalArgumentException Cuando el correo electr�nico no es v�lido como se indica anteriormente.
     */
    public void setEmail(String email) {
    	if (!(email.contains("@") && email.contains("."))) {
    		throw new IllegalArgumentException("El correo electr�nico debe ser v�lido.");
    	}
    	this.email = email;
    }

    /**
     * Consulta la localizaci�n/ubicaci�n del usuario.
     * @return Localizacion actual del usuario.
     */
    public String getLocation() {
        return location;
    }

    /**
     * Modifica la localizaci�n/ubicaci�n del usuario.
     * @param location Nueva localizacion del usuario.
     */
    public void setLocation(String location) {
        this.location = location;
    }

    /**
     * Consulta el numero de tel�fono del usuario.
     * @return Numero de tel�fono del usuario.
     */
    public int getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * Cambia el numero de telefono del usuario por el recibido.
     * @param phoneNumber Nuevo numero de tel�fono.
     */
    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * Consulta el numero de rese�as que ha realizado el usuario.
     * @return Numero entero de rese�as realizadas por el usuario.
     */
    public int getReviewNumber() {
        return reviewNumber;
    }

    /**
     * Avanza en 1 el contador de las rese�as realizadas por el usuario.
     */
    public void addReview() {
        reviewNumber++;
    }

    /**
     * Consulta si el usuario es administrador de la web o no.
     * @return True si es administrador, false si no lo es.
     */
    public boolean isAdmin() {
        return admin;
    }

    /**
     * Obtiene un ArrayList de Keys con la lista de claves deseadas.
     * @return ArrayList de Keys con la lista de deseados.
     */
    public ArrayList<Key> getWishList() {
        return new ArrayList<>(wishList);   //devolvemos una copia de la lista para que no la modifiquen
    }
    
    /**
     * Guarda la lista de deseados recibida reemplazandola por la actual.
     * @param wishList ArrayList de Keys que sera la nueva lista de deseados.
     */
    public void setWishList(ArrayList<Key> wishList) {
    	this.wishList = new ArrayList<Key>(wishList);
    }

    /**
     * A�ade una Key a la lista de deseados.
     * @param newKey Key a a�adir a la lista.
     */
    public void addKeyToWishList(Key newKey) {
        wishList.add(newKey);
    }
    
    /**
     * Metodo que comprueba si una Key esta en la lista de deseados del usuario por nombre de la Key,
     * como alternativa al contains de ArrayList porque al guardarlo en la lista creamos una Key nueva,
     * y eso puede dar problemas al comparar objetos.
     * @param keyName Nombre de la key a buscar en la lista.
     * @return Boolean true si esta en la lista, false si no esta.
     */
    public boolean hasKeyInWishList(String keyName) {
    	boolean result = false;
    	for (int i=0; i<wishList.size(); i++) {
    		if (keyName.equals(wishList.get(i).getName())) {
    			result = true;
    		}
    	}
    	return result;
    }
    
    /**
     * Borra una Key de la lista de deseados con el nombre de Key recibida.
     * @param keyName Nombre de la Key a borrar de la lista.
     */
    public void removeKeyFromWishList(String keyName) {
    	//solo borra si la Key estaba en la lista
    	if (hasKeyInWishList(keyName)) {
    		for (int i=0; i<wishList.size(); i++) {
    			if (keyName.equals(wishList.get(i).getName())) {
    				wishList.remove(i);
    			}
    		}
    	}
    }
}