package verkettete_listen;

public class Node {

    String string;

    // Referenz Nachbar
    Node nextElement;

    public Node(String string) {
        this.string = string;
        nextElement = null;
    }

    public String getString() {
        return string;
    }

    public void setString(String string) {
        this.string = string;
    }

    public Node getNextElement() {
        return nextElement;
    }

    public void setNextElement(Node nextElement) {
        this.nextElement = nextElement;
    }


}
