package collections;

public class Generics<T> {
    private T value;

    public Generics(T value) {
        this.setValue(value);
    }

    public T getValue() {
        return value;
    }

    public void setValue(T value) {
        this.value = value;
    }

}
