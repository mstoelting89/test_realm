package verkettete_listen;

public class Liste {

    // Startknoten
    Node startElem = new Node("Anfang der Liste");

    // Konstruktor
    public Liste() {

    }

    // Füge einen Knoten in die Liste
    public void addNewElement(String string) {
        Node newElement = new Node(string);
        Node lastElem = getLastElem();
        lastElem.setNextElement(newElement);
    }

    // Letztes Element
    public Node getLastElem() {
        Node le = startElem;
        while (le.getNextElement() != null) {
            le = le.getNextElement();
        }

        return le;
    }

}
