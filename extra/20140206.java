// 1.
import java.util.Random;
import java.util.LinkedList;
import java.util.concurrent.locks.*;

public class Main implements Runnable {

    static Deque dq = new Deque();

    public void run() {

        int x;
        Random r = new Random();

        for (int i = 0; i < 100; i++) {
            x = r.nextInt(100) + 1;

            if(i / 4 == 0) {
                dq.push_left(x);
            }else if(i / 4 == 1) {
                dq.pop_left();
            }else if(i / 4 == 2) {
                dq.push_right(x);
            }else {
                dq.pop_right();
            }
        }

        System.out.println(dq.size());
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
            }catch(InterruptedException e) {

            }
        }
    }
}

class Deque {

    static LinkedList<Integer> ll;
    static Lock lock_left;
    static Lock lock_right;

    public Deque() {
        ll = new LinkedList<Integer>();
        lock_left = new ReentrantLock();
        lock_right = new ReentrantLock();
    }

    public void push_left(int v) {
        try {
            lock_left.lock();
            ll.addFirst(v);
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            lock_left.unlock();
        }
    }

    public void push_right(int v) {
        try {
            lock_right.lock();
            ll.addLast(v);
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            lock_right.unlock();
        }
    }

    public void pop_left() {
        try {
            lock_left.lock();
            if(ll.size() > 0 && !lock_right.isLocked()) {
                ll.removeFirst();
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            lock_left.unlock();
        }
    }

    public void pop_right() {
        try {
            lock_right.lock();
            if(ll.size() > 0 && !lock_left.isLocked()) {
                ll.removeLast();
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            lock_right.unlock();
        }
    }

    public int size() {
        return ll.size();
    }
}

// 2.
/*
    Para a propriedade S1, foi criado um lock para cada ponta da LinkedList.
    Assim, cada lado só pode ou inserir ou remover um mesmo momento. Se mais
    de uma thread deseja realizar alguma operação numa ponta da lista, o lock
    só vai permitir que uma única thread tenha acesso.

*/
