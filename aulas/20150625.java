/*
	Reimplemente o programa do exercício anterior
	usando travas explícitas. Compare o desempenho
	dessa abordagem com o da anterior.
*/

import java.util.Random;
import java.util.concurrent.locks.*;

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
	static Lock l = new ReentrantLock();

	public void insert(int v){
   
		try {

			l.lock();
			Node node = new Node(v);

			if(root == null) {
				root = node;
				return;
			}

			insertRec(root, node);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			l.unlock();
		}
	}

	public void insertRec(Node root, Node node){

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
