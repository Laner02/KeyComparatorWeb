package sources;

import java.util.ArrayList;

/**
 * Clase de modela la funcionalidad de una Key de la aplicaci�n web.
 * @author Raul Villa
 */
public class Key {

    private String name;                    //nombre de la Key
    private String image;                   //imagen de la Key
    private String description;             //descripcion de la Key
    private float score;                    //valoracion media de la Key
    private double price;                   //precio de la Key
    private Platform platform;  			//lista de plataformas de la Key
    private ArrayList<Tags> tags;           //lista de etiquetas de la Key
    private ArrayList<Review> reviews;      //lista de rese�as para la Key
    private ArrayList<Shop> shops;			//lista de tiendas en las que se distribuye la Key

    /**
     * Inicializa una Key con los par�metros recibidos, con la lista de rese�as vac�a.
     * @param name Nombre de la Key.
     * @param image Ruta relativa de la imagen de la Key.
     * @param description Descripcion breve de la Key.
     * @param score Valoracion de la Key, sera un n�mero del 0 al 5, pasando por decimales intermedios.
     * @param tags Lista de etiquetas que tendr� la Key para describirla.
     * @param platform Plataforma para la que esta disponible la clave.
     */
    public Key(String name, String image, String description, float score, Platform platform, ArrayList<Tags> tags, ArrayList<Shop> shops) {
        setName(name);
        setImage(image);
        setDescription(description);
        setScore(score);
        setPlatform(platform);
        setTags(tags);
        reviews = new ArrayList<>();     //Inicializamos la lista de rese�as vac�a y se van a�adiendo
        setShops(shops);
        calculatePrice(shops);
    }

    /**
     * Obtiene el nombre de la Key.
     * @return String con el nombre de la Key.
     */
    public String getName() {
        return name;
    }

    /**
     * Sustituye el nombre de la Key con el recibido.
     * El nombre no podra ser nulo ni vac�o.
     * @param name Nuevo nombre de la key.
     * @throws IllegalArgumentException Cuando el nombre es nulo.
     * @throws IllegalArgumentException Cuando el nombre esta vac�o.
     */
    private void setName(String name) {
        if (name == null)
            throw new IllegalArgumentException("Error: El nombre no puede ser nulo.");
        if (name.isEmpty())
            throw new IllegalArgumentException("Error: El nombre no puede estar vac�o.");
        this.name = name;
    }

    /**
     * Obtiene la ruta de la imagen de la Key.
     * @return String con la ruta de la Key.
     */
    public String getImage() {
        return image;
    }

    /**
     * Sustituye la ruta de la imagen guardada en la Key.
     * La ruta no podra ser nula, ni estar vac�a. Deber� ser una ruta v�lida (Tener al menos 1 '/' en la ruta).
     * @throws IllegalArgumentException Cuando la ruta es nula.
     * @throws IllegalArgumentException Cuando la ruta esta vac�a.
     * @throws IllegalArgumentException Cuando la ruta no es v�lida.
     * @param image Nueva ruta de la imagen.
     */
    private void setImage(String image) {
        if (image == null)
            throw new IllegalArgumentException("Error: La ruta no puede ser nula.");
        if (image.isEmpty())
            throw new IllegalArgumentException("Error: La ruta no puede estar vac�a.");
        if (!image.contains("/"))
            throw new IllegalArgumentException("Error: La ruta debe ser una ruta v�lida: Tener al menos 1 '/' en el String");
        this.image = image;
    }

    /**
     * Obtiene la descripci�n de la Key.
     * @return String con la descripci�n de la Key.
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sustituye la descripci�n actual de la Key por la recibida.
     * La descripci�n no podr� estar vac�a.
     * @param description Nueva descripci�n para la Key.
     * @throws IllegalArgumentException Cuando la descripci�n es nula.
     * @throws IllegalArgumentException Cuando la descripci�n esta vac�a.
     */
    public void setDescription(String description) {
        if (description == null)
            throw new IllegalArgumentException("Error: La descripci�n no puede ser nula.");
        if (description.isEmpty())
            throw new IllegalArgumentException("Error: La descripci�n no puede estar vac�a.");
        this.description = description;
    }

    /**
     * Obtiene la valoraci�n de la Key. Esta valoraci�n estara entre el 0.0 y 5.0.
     * @return Valoracion en punto flotante de la Key.
     */
    public float getScore() {
        return score;
    }

    /**
     * M�todo que sustituye la valoracion que tiene una Key, el float recibido debe estar entre 0.0 y 5.0.
     * @param score nueva valoracion en decimal, entre 0.0 y 5.0.
     * @throws IllegalArgumentException Cuando el par�metro recibido no esta entre 0.0 y 5.0.
     */
    private void setScore(float score) {
        if (score < 0f || score > 5f)
            throw new IllegalArgumentException("Error creando Key: La valoraci�n debe estar entre 0.0 y 5.0.");
        this.score = score;
    }

    /**
     * Obtiene la media de las valoraciones de las rese�as que tiene una Key.
     * Se puede llamar a esta funcion y usarla para hacer un set a la valoracion de una Key.
     * @return La media de las valoraciones en punto flotante.
     */
    public float getScoreAverage() {
        float averageScore = 0;
        for (int i=0; i<reviews.size(); i++) {
            averageScore += reviews.get(i).getScore();
        }
        return averageScore/reviews.size();
    }

    /**
     * Obtiene una lista con las etiquetas de la Key.
     * @return ArrayList de Tags con las etiquetas.
     */
    public ArrayList<Tags> getTags() {
        return new ArrayList<Tags>(tags);
    }

    /**
     * Modifica la lista de etiquetas actual de la clave con la lista recibida.
     * La lista recibida no podra ser nula.
     * @param tags Nuevo ArrayList de Tags con las etiquetas para la clave.
     * @throws IllegalArgumentException Cuando la lista de Tags recibida es nula.
     */
    public void setTags(ArrayList<Tags> tags) {
        if(tags == null)
            throw new IllegalArgumentException("Error: La lista de claves no puede ser nula.");
        this.tags = new ArrayList<>(tags);          //copiamos el arraylist
    }

    /**
     * A�ade un Tag a la lista de etiquetas de la clave.
     * El tag no podra ser nulo.
     * @param tag Tag a a�adir a la lista de Tags de la clave
     * @throws IllegalArgumentException Cuando el Tag recibido es nulo.
     */
    public void addTag(Tags tag) {
        if (tag == null)
            throw new IllegalArgumentException("Error: El Tag a a�adir no puede ser nulo");
        tags.add(tag);
    }

    /**
     * Obtiene la lista de Rese�as asociadas a la clave.
     * @return ArrayList de Reviews con las rese�as de la clave.
     */
    public ArrayList<Review> getReviews() {
        return new ArrayList<Review>(reviews);
    }

    /**
     * Modifica la lista entera de rese�as que tiene la clave.
     * La lista de rese�as no podr� ser nula.
     * @param reviews Nueva lista de Review (rese�as) a almacenar en la clave.
     * @throws IllegalArgumentException Cuando la lista de rese�as es nula.
     */
    public void setReviews(ArrayList<Review> reviews) {
    	if (reviews == null)
    		throw new IllegalArgumentException("Error: la lista de rese�as no puede ser nula");
    	this.reviews = new ArrayList<>(reviews);
    }

    /**
     * A�ade una rese�a a la lista de rese�as asociadas a la clave.
     * La rese�a recibida no podra ser nula.
     * @param review Rese�a a a�adir a la lista de las mismas en la clave.
     * @throws IllegalArgumentException Cuando la review recibida es nula.
     */
    public void addReview(Review review) {
        if (review == null)
            throw new IllegalArgumentException("Error: La rese�a a a�adir no puede ser nula");
        reviews.add(review);
    }

    /**
     * Comprueba si la lista de rese�as de la clave esta vac�a o no.
     * @return true si la clave tiene rese�as, false si no tiene.
     */
    public boolean hasReviews() {
    	return !reviews.isEmpty();
    }

    /**
     * Obtiene la plataforma para la que esta disponible la clave.
     * @return Platform con las plataforma asociada a la clave.
     */
    public Platform getPlatform() {
        return platform;
    }

    /**
     * TODO rehacer este javadoc para que sea de 1 sola plataforma
     * Modifica la lista de plataformas para las que esta disponible la clave con la lista
     * de Platforms recibida. La lista recibida no podra ser nula ni estar vac�a.
     * @param newPlatforms Nueva lista de Platform (plataformas) a cambiar por la actual.
     * @throws IllegalArgumentException Cuando la lista de plataformas recibida es nula.
     */
    public void setPlatform(Platform newPlatform) {
        if (newPlatform == null)
            throw new IllegalArgumentException("Error: la lista de plataformas no puede ser nula.");
        platform = newPlatform;
    }

    public double getPrice() {
    	return price;
    }
    
    //metodo que calcula el minimo precio de las tiendas asociadas a la clave
    public void calculatePrice(ArrayList<Shop> shops) {
    	if (shops == null)
    		throw new IllegalArgumentException("Error Key: La lista de tiendas no puede ser nula.");
    	if (shops.isEmpty())
    		throw new IllegalArgumentException("Error Key: La lista de tiendas no puede estar vac�a.");
    	
    	double minPrice = Double.MAX_VALUE;
    	
    	for (int i = 0; i < shops.size(); i++) {
    		if (shops.get(i).getPrice() < minPrice)
    			minPrice = shops.get(i).getPrice();
    	}
    	
    	//es imposible aqui que el precio minimo sea negativo no?
    	price = minPrice;
    }
    
    //TODO hacer javadoc de aqui y de los de precio
    public ArrayList<Shop> getShops() {
    	return new ArrayList<Shop>(shops);
    }
    
    public void setShops(ArrayList<Shop> newShops) {
    	if (newShops == null)
    		throw new IllegalArgumentException("Error Key: La lista de tiendas no puede ser nula.");
    	if (newShops.isEmpty())
    		throw new IllegalArgumentException("Error Key: La lista de tiendas no puede estar vac�a.");
    	shops = new ArrayList<Shop>(newShops);
    }
}