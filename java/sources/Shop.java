package sources;

import java.util.ArrayList;

public class Shop {

    private String shopName;        			//nombre de la tienda
    private String link;            			//enlace a la pagina de compra
    private double price;           			//precio de la key en la pagina
    private String image;           			//ruta de la imagen
    private ArrayList<Opinion> opinions;        //lista de opiniones sobre la tienda

    public Shop(String shopName, String link, double price, String image, ArrayList<Opinion> opinions) {
        setShopName(shopName);
        setLink(link);
        setPrice(price);
        setImage(image);
        setOpinions(opinions);
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String newShopName) {
        if (newShopName == null)
            throw new IllegalArgumentException("Error Shop: El nombre de la tienda no puede ser nulo.");
        if (newShopName.isEmpty())
            throw new IllegalArgumentException("Error Shop: El nombre de la tienda no puede estar vacío.");
        shopName = newShopName;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String newLink) {
        if (newLink == null)
            throw new IllegalArgumentException("Error Shop: El enlace de la tienda no puede ser nulo.");
        if (newLink.isEmpty())
            throw new IllegalArgumentException("Error Shop: El enlace de la tienda no puede estar vacío.");
        this.link = newLink;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double newPrice) {
        if (newPrice <= 0)
            throw new IllegalArgumentException("Error Shop: El precio de la Key en tienda no puede ser negativo o 0.");
        this.price = newPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String newImage) {
        if (newImage == null)
            throw new IllegalArgumentException("Error Shop: La imagen de la tienda no puede ser nula.");
        if (newImage.isEmpty())
            throw new IllegalArgumentException("Error Shop: La imagen de la tienda no puede estar vacía.");
        this.image = newImage;
    }

    public ArrayList<Opinion> getOpinions() {
        return new ArrayList<>(opinions);
    }

    public void setOpinions(ArrayList<Opinion> newOpinions) {
        if (newOpinions == null)
            throw new IllegalArgumentException("Error Shop: La lista de opiniones no puede ser nula.");
        this.opinions = new ArrayList<>(newOpinions);
    }

    public void addOpinion(Opinion newOpinion) {
        if (newOpinion == null)
            throw new IllegalArgumentException("Error Shop: La nueva opinion no puede ser nula.");
        opinions.add(newOpinion);
    }
    
  //metodo que devuelve true si la lista tiene opiniones, falase si esta vacia
    public boolean hasOpinions() {
        return !opinions.isEmpty();
    }
}