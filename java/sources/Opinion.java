package sources;

//TODO añadir javadoc
public class Opinion {

    private String authorUserName;
    private String description;

    public Opinion(String authorUserName, String description) {
        setAuthorUserName(authorUserName);
        setDescription(description);
    }

    public String getAuthorUserName() {
        return authorUserName;
    }

    public void setAuthorUserName(String newAuthorUserName) {
        if (newAuthorUserName == null)
            throw new IllegalArgumentException("Error Opinion: El username del autor no puede ser nulo.");
        if (newAuthorUserName.isEmpty())
            throw new IllegalArgumentException("Error Opinion: El username del autor no puede estar vacío.");
        this.authorUserName = newAuthorUserName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String newDescription) {
        if (newDescription == null)
            throw new IllegalArgumentException("Error Opinion: La descipcion de la opinion no puede ser nula.");
        if (newDescription.isEmpty())
            throw new IllegalArgumentException("Error Opinion: La descipcion de la opinion no puede estar vacía.");
        this.description = newDescription;
    }
}