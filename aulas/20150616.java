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
		
		while(c <= MAX) {
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

/*
    Construa um programa onde N threads incrementam
    contadores locais (não-compartilhados) em um laço. Cada
    thread imprime o valor do seu contador a cada incremento.
    As threads param quando seus contadores chegam a um
    valor limite X, recebido como entrada pelo programa.
    - por que as saídas das threads se misturam?
*/

/*
    Porque cada thread possui um "time slice" no processador.
    Logo, quando uma thread tem muito serviço e o tempo de processamento
    é curto, a thread é pausada e dá a vez pra outra thread.
    A saída fica não-determinística.
*/

public class Main implements Runnable {
    
    public void run() {
        int c = 0;
        
        while(c <= 10000) {
            
            c++;
            
            try {
                Thread.sleep(1);
            } catch(InterruptedException e) {}
        }
    }
    
    public static void main(String[] args) {
        int N = Integer.parseInt(args[0]);
        Thread[] t = new Thread[N];
        
        for(int i = 0; i < N; i++) {
            t[i] = (new Thread(new Main()));
            t[i].start();
        }
        
        for(int i = 0; i < N; i++) {
            try {
                t[i].join();
            } catch(InterruptedException e) {}
        }
    }
}

/*
    Agora mude seu programa para que as threads modifiquem
    um contador global compartilhado entre elas.
    - o que acontece com os resultados?
*/

/*
    o resultado do contador é sequencial, mas as threads
    dividiram todo o trabalho. O funcionamento é dinâmico (UOU!).
    As threads compatilham uma varíavel (counter).
*/

public class Main implements Runnable {
    
    public static int Counter = 0;
    public static final int MAX = Integer.MAX_VALUE;
    
    public static synchronized int getAndInc() {
        return Counter++;
    }
    
    public void run() {
        int c = getAndInc();
        while(c <= MAX) {
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
    Modifique o último programa que você construiu
    para que, a cada iteração, a thread espere 1ms. A
    thread que terminar a contagem primeiro (realizar
    todas as iterações) deve interromper todas as outras
    que estão executando.
*/

import java.util.concurrent.atomic.AtomicBoolean;

public class Main implements Runnable{

    static AtomicBoolean ab = new AtomicBoolean(false);
    
    public void run() {
        
        int c = 0;
        
        while(!ab.get()) {
        
            System.out.println(c);

            if(c == 100000) {
                ab.set(true);
                break;
            } else {
                c++;
            }
            
            try {
                Thread.sleep(3);
            } catch(InterruptedException e) {}
        }
    }
    
    public static void main(String[] args) {
        int N = Integer.parseInt(args[0]);
        Thread[] t = new Thread[N];
        
        for(int i = 0; i < N; i++) {
            t[i] = (new Thread(new Main()));
            t[i].start();
        }
        
        for(int i = 0; i < N; i++) {
            try {
                t[i].join();
            } catch(InterruptedException e) {}
        }
    }
}
