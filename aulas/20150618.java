/*
    Construa uma classe que implementa uma fila
    segura para um número indeterminado de threads
    que funcione da seguinte maneira.
    - se apenas uma thread tentar inserir ou remover
    um elemento, ela consegue
    - se mais que uma estiver tentando ao mesmo tempo, uma
    consegue e as outras esperam. A próxima só conseguirá
    realizar a operação quando a anterior tiver terminado.
*/

import java.util.Random;
import java.util.Vector;

public class Main implements Runnable {

    public void run() {

        Random rand = new Random();
        SafeQueue sq = new SafeQueue();
        int randNum, tmp;

        for (int i = 0; i < 10; i++) {
            randNum = rand.nextInt(20) + 1;
            if(randNum % 2 == 0) { sq.add(randNum); System.out.println(randNum); }
            else { tmp = sq.remove(); System.out.println(tmp); } 
        }
    }

    public static void main(String[] args) {
        
        int N = Integer.parseInt(args[0]);
        Thread[] t = new Thread[N];

        for (int i = 0; i < N; i++) {
            t[i] = (new Thread(new Main()));
            t[i].start();
        }

        for (int i = 0; i < N; i++) {
            try {
                t[i].join();
            }catch(InterruptedException e) {}
        }
    }
}

class SafeQueue {
    
    Vector<Integer> v;

    public SafeQueue() {
        v = new Vector<Integer>();
    }

    public synchronized void add(int i) {
        v.add(i);
    }

    public synchronized int remove() {
        if(!v.isEmpty()) return v.remove(0);
        else return -999;
    }
}
