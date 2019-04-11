public class Connection{
    PlugKey k1, k2;
    float gap;
    int r, g, b;

    public Connection(PlugKey k1, PlugKey k2){
        this.k1 = k1;
        this.k2 = k2;
        gap = connectionGap;
        r = int(random(50,255));
        g = int(random(50,255));
        b = int(random(50,255));
        k1.setSelectedColors(r,g,b);
        k2.setSelectedColors(r,g,b);
    }

    public PlugKey getK1(){
        return k1;
    }

    public PlugKey getK2(){
        return k2;
    }

    public void show(){
        stroke(r, g, b);
        if (k1.getRow() != k2.getRow()){
            line1();
            return;
        }
        if (k1.getRow() == 0){
            line2();
            return;
        }
        if (k1.getRow() == 1){
            line3();
            return;
        }

    }

    public void line1(){
        if (k1.getRow() == 0){
            line(k1.getX(), k1.getY(), k1.getX(), k1.getY() + gap);
            line(k1.getX(), k1.getY() + gap, k2.getX(), k1.getY() + gap);
            line(k2.getX(), k1.getY() + gap, k2.getX(), k2.getY());
        }
        if (k1.getRow() == 1){
            line(k1.getX(), k1.getY(), k1.getX(), k1.getY() - gap);
            line(k1.getX(), k1.getY() - gap, k2.getX(), k1.getY() - gap);
            line(k2.getX(), k1.getY() - gap, k2.getX(), k2.getY());
        }
    }

    public void line2(){
        line(k1.getX(), k1.getY(), k1.getX(), k1.getY() - gap);
        line(k1.getX(), k1.getY() - gap, k2.getX(), k1.getY() - gap);
        line(k2.getX(), k1.getY() - gap, k2.getX(), k2.getY());
    }

    public void line3(){
        line(k1.getX(), k1.getY(), k1.getX(), k1.getY() + gap);
        line(k1.getX(), k1.getY() + gap, k2.getX(), k1.getY() + gap);
        line(k2.getX(), k1.getY() + gap, k2.getX(), k2.getY());
    }
}
