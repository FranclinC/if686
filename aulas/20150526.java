/*
	Implemente um programa que imprime todos os
	números entre 1 e 2 bilhões usando várias threads
	para particionar o trabalho.
*/

public class Main implements Runnable {

	public static int Counter = 0;
	public static final int MAX = Integer.MAX_VALUE;
	
	public static synchronized int getAndInc() {
		return Counter++;
	}
	
	public void run() {
		int c = getAndInc();
		
		while(c <= 100000) {
			c = getAndInc();
		}
	}
	
	public static void main(String[] args) {
		
		int nThreads = Integer.parseInt(args[0]);
		Thread[] t = new Thread[nThreads];
		
		for(int i = 0; i < nThreads; ++i) {
			t[i] = (new Thread(new Main()));
			t[i].start(); 
		}        
		
		for(int i = 0; i < nThreads; ++i) {
			try {
				t[i].join();
			} catch (InterruptedException e) {}
		}
	}
}

/*
	Implemente um programa que calcula todos os
	números entre 1 e um valor N fornecido
	como argumento. Seu programa deve dividir o
	trabalho a ser realizado entre X threads (onde X
	também é uma entrada do programa) para tentar
	realizar o trabalho de maneira mais rápida que uma
	versão puramente sequencial.
	A thread principal do programa deve imprimir os
	números primos identificados apenas quando as 
	outras threads terminarem
*/

import java.util.Vector;

public class Main implements Runnable {

	public static int Counter = 2;
	public static int N, X;
	public static Vector<Integer> v = new Vector<Integer>();

	public synchronized int getAndInc() {
		return Counter++;
	}

	public boolean fastPrime(int n) {
		int max = (int) Math.sqrt(n);
		
		for (int i = 2; i <= max; i++) {
			if(n % i == 0) {
				return false;
			}
		}

		return true;
	}

	public void run() {
		int c = getAndInc();
		
		while(c <= N) { 
			if(fastPrime(c)) {
				v.add(c);
			}

			c = getAndInc();
		}
	}

	public static void main(String[] args) {
		
		N = Integer.parseInt(args[0]);
		X = Integer.parseInt(args[1]);
		Thread[] t = new Thread[X];

		for (int i = 0; i < X; i++) {
			t[i] = (new Thread(new Main()));
			t[i].start();
		}

		for (int i = 0; i < X; i++) {
			try {
				t[i].join();
			} catch (InterruptedException e) {}
		}

		int sz = v.size();

		for (int i = 0; i < sz; i++) {
			System.out.println(v.elementAt(i));
		}
	}
}
