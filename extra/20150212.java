// 1.

import java.util.concurrent.atomic.AtomicBoolean;

public class Main implements Runnable{

    static SyncChain sc = new SyncChain();

    public void run() {

        for (int i = 0; i < 30; i++) {
            if(i % 2 == 0) sc.push(Thread.currentThread());
            else sc.pop();
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

class SyncChain {

    static Object[] ch;
    static AtomicBoolean ab;

    SyncChain() {
        ch = new Object[1];
        ab = new AtomicBoolean(false);
    }

    public synchronized void push(Object e) {
        while(ab.get()) {
            try {
                this.wait();
            }catch(Exception ex) {}
        }

        ch[0] = e;
        ab.set(true);
        this.notifyAll();
    }

    public synchronized void pop() {
        while(!ab.get()) {
            try {
                this.wait();
            }catch(Exception ex) {}
        }

        ch[0] = null;
        ab.set(false);
        this.notifyAll();
    }

    public Object peek() {
        Object o = ch[0];
        return o;
    }
}

// 2.
/*
    (fairness) O synchronized aplicado nos métodos push() e pop() garante
justiça entre as threads. Logo, uma thread que chegar primeiro
ao monitor, o synchronized (pelo escalonador do sistema) garante
um acesso FIFO aos métodos.
    (deadlock) Não é possível acontecer deadlock na aplicação porque não
existe as quatro condições necessárias para esta falha ser levantada no sistema.
*/
