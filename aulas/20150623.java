/*
	Defina uma classe ArvoreBusca que implementa uma árvore
	de busca onde é possível realizar inserções de elementos. Essa
	estrutura de dados deve funcionar com várias threads. Faça o
	que é pedido:
	- implemente um método main() que cria 50 threads onde cada
	uma insere 2000 números aleatórios nessa árvore.
	- meça o tempo de execução do seu programa, comparando-o com o
	de uma execução puramente sequencial.
	- o que significa "funcionar com várias threads"?
*/

// Versão SEM threads => tempo 43
import java.util.Random;

public class Main {
    
    public static void main(String[] args) {
        
        long start = System.currentTimeMillis();
        
        int x;
        ArvoreBusca ab = new ArvoreBusca();
        Random r = new Random();
        
        for(int i = 0; i < 100000; i++) { // 100000 <= 50 threads x 2000 ins.
            x = r.nextInt(500000) + 1;
            ab.insert(x);
        }
        
        //ab.printInorder();
        System.out.println(System.currentTimeMillis() - start);
    }
}

class ArvoreBusca {
  
    public Node root;

    public void insert(int v){
        Node node = new Node(v);

        if(root == null) {
            root = node;
            return;
        }

        insertRec(root, node);
    }

    private void insertRec(Node root, Node node){

        if (root.value > node.value){

            if (root.left == null){
                root.left = node;
                return;
            }else{
                insertRec(root.left, node);
            }
        }else{
            if (root.right == null){
                root.right = node;
                return;
            }else{
                insertRec(root.right, node);
            }
        }
    }
    
    public void printInorder() {
        printInOrderRec(root);
        System.out.println("");
    }

    private void printInOrderRec(Node curr) {
        
        if (curr == null) {
            return;
        }
        
        printInOrderRec(curr.left);
        System.out.print(curr.value+", ");
        printInOrderRec(curr.right);
    }

}

class Node {

    int value;
    Node left;
    Node right;
    
    public Node(int v) {
        this.value = v;
        this.left = null;
        this.right = null;
    }
}

// Versão COM threads => tempo 320
import java.util.Random;

public class Main implements Runnable {

    static ArvoreBusca ab = new ArvoreBusca();
    static Random r = new Random();

    public void run() {
        
        int x;
        
        for(int i = 0; i < 2000; i++) {
            x = r.nextInt(50000) + 1;
            ab.insert(x);
        }
    }
    
    public static void main(String[] args) {
        
        long start = System.currentTimeMillis();
        
        Thread[] t = new Thread[50];

        for(int i = 0; i < 50; i++) {
            t[i] = (new Thread(new Main()));
            t[i].start();
        }
        
        for(int i = 0; i < 50; i++) {
            try {
                t[i].join();
            }catch(InterruptedException e) {}
        }

        System.out.println(System.currentTimeMillis() - start);
    }
}

class ArvoreBusca {
  
    public Node root;

    public synchronized void insert(int v){
        Node node = new Node(v);

        if(root == null) {
            root = node;
            return;
        }

        insertRec(root, node);
    }

    public synchronized void insertRec(Node root, Node node){

        if (root.value > node.value){

            if (root.left == null){
                root.left = node;
                return;
            }else{
                insertRec(root.left, node);
            }
        }else{
            if (root.right == null){
                root.right = node;
                return;
            }else{
                insertRec(root.right, node);
            }
        }
    }
}

class Node {

    int value;
    Node left;
    Node right;
    
    public Node(int v) {
        this.value = v;
        this.left = null;
        this.right = null;
    }
}
