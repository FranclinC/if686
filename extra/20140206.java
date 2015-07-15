// 1.
import java.util.Random;
import java.util.LinkedList;
import java.util.concurrent.locks.*;

public class Main implements Runnable {

    static Deque dq = new Deque();

    public void run() {

        int x;
        Random r = new Random();

        for (int i = 0; i < 10; i++) {
            x = r.nextInt(20) + 1;
	        
	        if(i % 2 == 0) {
	            if(x % 2 == 0) dq.push_left(x);
	            else dq.pop_left();        
	        }else {
	            if(x % 2 == 0) dq.push_right(x);
	            else dq.pop_right();
	        }
        }

        System.out.println(dq.size());
    }

    public static void main(String[] args) {

        int N = Integer.parseInt(args[0]);
        Thread[] t = new Thread[N];
        dq.push_left(-1); // elemento auxiliar

        for (int i = 0; i < N; i++) {
            t[i] = (new Thread(new Main()));
            t[i].start();
        }

        for (int i = 0; i < N; i++) {
            try {
                t[i].join();
            }catch(InterruptedException e) {

            }
        }
    }
}

class Deque {

    static LinkedList<Integer> ll;
    static ReentrantLock lock_left;
    static ReentrantLock lock_right;

    public Deque() {
        ll = new LinkedList<Integer>();
        lock_left = new ReentrantLock();
        lock_right = new ReentrantLock();
    }

    public void push_left(int v) {
        lock_left.lock();
        try {
            ll.addFirst(v);
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            lock_left.unlock();
        }
    }

    public void push_right(int v) {
        lock_right.lock();
        try {
            ll.addLast(v);
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            lock_right.unlock();
        }
    }

    public void pop_left() {
        lock_left.lock();
        try {
            if(ll.size() > 1) {
                if(ll.peekLast() != -1) {
                    ll.removeFirst();
                }
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            lock_left.unlock();
        }
    }

    public void pop_right() {
        lock_right.lock();
        try {

            if(ll.size() > 1) {
                if(ll.peekLast() != -1) {
                    ll.removeLast();
                }
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            lock_right.unlock();
        }
    }

    public int size() {
        return ll.size() - 1;
    }
}

// 2.
/*
        Para a propriedade S1, foi criado um lock para cada ponta da LinkedList.
    Assim, cada lado só pode ou inserir ou remover um mesmo momento. Se mais
    de uma thread deseja realizar alguma operação numa ponta da lista, o lock
    só vai permitir que uma única thread tenha acesso.
        Para a propriedade S2, 
        Sobre a propriedade L1, o programa nunca entrará em deadlock 
    porque não tem possibilidade de existir espera circular (uma das 
    condições básicas para existência de deadlock).
        Sobre a propriedadeL2, 
        Por fim, a propriedade L3 é garantida porque cada lado da LinkedList 
    é controlado por um lock estático. Só é possível remover ou inserir 
    em momentos diferentes.
*/
