package sources;

/**
 * Clase que modela una rese�a de una Key.
 * @author Raul Villa
 */
public class Review {

    private String title;
    private String description;
    private float score;
    private String reviewUserName;		//nombre del usuario que realiza la review, para fines de la vista

    public Review(String title, String description, float score, String reviewUserName) {
        setTitle(title);
        setDescription(description);
        setScore(score);
        setReviewUserName(reviewUserName);
    }

    /**
     * Obtiene el titulo actual de la rese�a.
     * @return Titulo de la rese�a.
     */
    public String getTitle() {
        return title;
    }

    /**
     * Modifica el titulo de la rese�a por el recibido.
     * El nuevo titulo no podr� ser nulo ni estar vac�o.
     * @param newTitle Nuevo titulo de la rese�a.
     * @throws IllegalArgumentException Cuando el titulo recibido es nulo.
     * @throws IllegalArgumentException Cuando el titulo recibido esta vac�o.
     */
    public void setTitle(String newTitle) {
        if (newTitle == null)
            throw new IllegalArgumentException("Error Review: El nuevo titulo de rese�a no puede ser nulo.");
        if (newTitle.isEmpty())
            throw new IllegalArgumentException("Error Review: El nuevo titulo de rese�a no puede estar vac�o.");
        title = newTitle;
    }

    /**
     * Obtiene la descripci�n actual de la rese�a.
     * @return Descripci�n de la rese�a.
     */
    public String getDescription() {
        return description;
    }

    /**
     * Modifica la descripci�n de la rese�a por la recibida.
     * La nueva descripcion no podr� ser nula ni estar vac�a.
     * @throws IllegalArgumentException Cuando la descripcion recibida es nula.
     * @throws IllegalArgumentException Cuando la descripcion recibida esta vac�a.
     * @param newDescription Nueva descripci�n de la rese�a.
     */
    public void setDescription(String newDescription) {
        if (newDescription == null)
            throw new IllegalArgumentException("Error Review: La descripci�n de rese�a no puede ser nula.");
        if (newDescription.isEmpty())
            throw new IllegalArgumentException("Error Review: La descripci�n no puede estar vac�a.");
        description = newDescription;
    }

    /**
     * Obtiene la valoraci�n actual de la rese�a.
     * @return Numero en punto flotante con la valoraci�n de la rese�a.
     */
    public float getScore() {
        return score;
    }

    /**
     * Modifica la valoraci�n de la rese�a por la recibida.
     * La nueva valoraci�n debera ser un numero en punto flotante mayor que 0.0 y menor que 5.0.
     * @param newScore Nueva valoraci�n de la rese�a.
     * @throws IllegalArgumentException Cuando la valoraci�n recibida no es v�lida.
     */
    public void setScore(float newScore) {
        if (newScore < 0f || newScore > 5f)
            throw new IllegalArgumentException("Error Review: La valoraci�n debe ser v�lida: numero en punto flotante mayor que 0.0 y menor que 5.0");
        score = newScore;
    }
    
    /**
     * Obtiene el nombre del usuario que realiz� la rese�a.
     * @return Username del usuario que realiz� la rese�a.
     */
    public String getReviewUserName() {
    	return reviewUserName;
    }
    
    /**
     * Metodo privado que modifica el nombre de usuario almacenado que escribio la rese�a.
     * El nombre no podra ser nulo ni estar vac�o.
     * Cuando un usuario cambia su nombre de usuario la rese�a mantendra el nombre de usuario anterior.
     * @param newReviewUserName Nuevo nombre de usuario para almacenar en la rese�a como autor.
     * @throws IllegalArgumentException Cuando el nombre recibido es nulo.
     * @throws IllegalArgumentException Cuando el nombre recibido esta vac�o.
     */
    private void setReviewUserName(String newReviewUserName) {
    	if (newReviewUserName == null)
    		throw new IllegalArgumentException("Error Review: El nombre no puede ser nulo.");
    	if (newReviewUserName.isEmpty())
    		throw new IllegalArgumentException("Error Review: El nombre no puede estar vac�o.");
    	reviewUserName = newReviewUserName;
    }
}
