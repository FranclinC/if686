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
			System.out.println(c);
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
