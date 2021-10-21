package Binärbaum;

public class Tree {

    Node root;

    public Tree() {

    }

    public void addNode(int value) {
        Node newNode = new Node(value);
        if (root == null) {
            root = newNode;
        } else {
            Node currentNode = root;
            Node parent;

            while(true) {
                parent = currentNode;

                if(value < currentNode.value) {
                    currentNode = currentNode.left;

                    if (currentNode == null) {
                        parent.left = newNode;
                        return;
                    }
                } else {
                    currentNode = currentNode.right;

                    if (currentNode == null) {
                        parent.right = newNode;
                        return;
                    }
                }
            }
        }
    }

    public int countNodes(Node r) {
        if (r == null) {
            return 0;
        } else {
            int l = 1;
            l += countNodes(r.left);
            l += countNodes(r.right);
            return l;
        }
    }

    // InOrder LWR
    public void inOrderTravers(Node currentNode) {

        if (currentNode != null) {
            inOrderTravers(currentNode.left); // l
            System.out.println(currentNode.value); // w
            inOrderTravers(currentNode.right); // r
        }
    }

    // PreOrder WLR
    public void preOrderTravers(Node currentNode) {

        if (currentNode != null) {
            System.out.println(currentNode.value); // w
            inOrderTravers(currentNode.left); // l
            inOrderTravers(currentNode.right); // r
        }
    }

    // PostOrder LRW
    public void postOrderTravers(Node currentNode) {

        if (currentNode != null) {
            inOrderTravers(currentNode.left); // l
            inOrderTravers(currentNode.right); // r
            System.out.println(currentNode.value); // w
        }
    }

    // Node finden
    public Node find(int value) {
        Node currentNode = root;

        if (currentNode == null) {
            return null;
        }

        while(currentNode.value != value) {

            if (value < currentNode.value) {
                currentNode = currentNode.left;
            } else {
                currentNode = currentNode.right;
            }
        }

        return currentNode;
    }
}
