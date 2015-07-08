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

/*
	implemente um vetor (tamanho fixo) de
	inteiros seguro para threads com operações
	para ler e escrever em determinado índice e
	para trocar os valores armazenados em dois
	índices distintos.
*/

import java.util.Random;
import java.util.concurrent.locks.*;

public class Main implements Runnable {

	static Var[] vector = new Var[30];

	public void run() {

		int x, p;
		Random r = new Random();

		for (int i = 0; i < 50; i++) {
			
			x = r.nextInt(1000) + 1;
			p = (r.nextInt(1000) + 1) % 30;

			if(i % 2 == 0) {
				System.out.println("set: " + p + ", value: " + x);
				set(p, x);
			}else {
				System.out.println("get: " + get(p));
			} 
		}
	}

	public void set(int p, int v) {
		try {
			vector[p].l.lock();
			vector[p].value = v;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			vector[p].l.unlock();
		}
	}

	public int get(int p) {

		int var = 0;

		try {
			vector[p].l.lock();
			var = vector[p].value;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			vector[p].l.unlock();
			return var;
		}
	}

	public static void main(String[] args) {
		
		Thread[] t = new Thread[3];

		for (int i = 0; i < 30; i++) {
			vector[i] = new Var();
			vector[i].l = new ReentrantLock();
			vector[i].value = 0;
		}

		for (int i = 0; i < 3; i++) {
			t[i] = (new Thread(new Main()));
			t[i].start();
		}

		for (int i = 0; i < 3; i++) {
			try {
				t[i].join();
			}catch(InterruptedException e) {}
		}
	}
}

class Var {
	int value;
	Lock l;

	public Var() {
		l = new ReentrantLock();
	}
}

