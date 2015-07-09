-- TRABALHO 13

import java.util.concurrent.locks.ReentrantLock;

public class Main {
	
	public static void main(String[] args) {

		int N = Integer.parseInt(args[0]);
		Thread[] threads = new Thread[N];
		Manager m = new Manager(N);
		
		for(int i = 0; i < N; i++) {
			threads[i] = new Thread(new Worker(m, i));
			threads[i].start();
		}
		
		for(int i = 0; i < N; i++) {	
			try {
				threads[i].join();
			} catch (InterruptedException e) {}
		}
	}
}

class Worker implements Runnable {
	
	Manager m;
	int token, id;
	
	public Worker(Manager boss,int id) {
		m = boss;
		this.id = id;
	}
	
	public void run() {
		for (int i = 0; i < 1000; i++) {
			get();
			work();
			m.next();
		}
	}
	
	public void work(){
		System.out.println("Thread "+ id+"Doing work"+"with token"+ token);
		for (int i = 0; i < 100; i++) {
			
		}	
	}

	public void get() {
		token = m.get(id);
		do{ 
			m.l.lock();
			if(m.turn!=token) m.l.unlock();
		}while (!m.l.isHeldByCurrentThread());	
	}
}

class Manager {

	ReentrantLock l;
	int cnt, turn, max;
	
	public Manager(int n) {
		max = n;
		l = new ReentrantLock();
		cnt = 0;
		turn = 0;
	}

	public synchronized int get(int id) {
		return cnt++;
	}

	public synchronized  void next() {	
	 	turn++;	
	 	l.unlock();
	}
}
