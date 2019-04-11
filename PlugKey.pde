public class PlugKey{
    float diameter, x, y;
    char letter;
    //Colors for the keys.
    int kR, kG, kB, row;

    //Colors for the outline.
    int oR, oG, oB;
    boolean highLight, selected;

    public PlugKey(float x, float y, char c, int row){
        this.diameter = 55;
        this.x = x;
        this.y = y;
        this.letter = c;
        this.kR = 150;
        this.kG = 150;
        this.kB = 150;
        this.oR = 0;
        this.oG = 0;
        this.oB = 0;
        this.highLight = false;
        this.selected = false;
        this.row = row;

    }

    /**
     * Display the current key.
     */
    public void show(){
        highLight();
        selectColors();
        pushMatrix();
        //Translate the center point to be at the x,y coord for this object.
        translate(x, y);
        //Thickness of the outline
        strokeWeight(3);
        //Color of the outline
        stroke(oR,oG,oB);
        //Don't fill the circle
        fill(kR, kG, kB);
        //Draw the circle from its center point
        rectMode(CENTER);
        //Draw a circle at x,y with width and height of size
        rect(0, 0, diameter, diameter);
        //Text size
        textSize(30);
        //Draw text from the center
        textAlign(CENTER, CENTER);
        //Color of the text.
        fill(0,0,0);
        //Display the text.
        text(letter, 0, -5);
        popMatrix();
    }

    private void selectColors(){
        if(highLight){
            this.kR = 143;
            this.kG = 255;
            this.kB = 137;
        }
        else{
            this.kR = 150;
            this.kG = 150;
            this.kB = 150;
        }
    }

    public void highLight(){
        if (dist(x, y, mouseX, mouseY) < diameter/2){
            this.highLight = true;
        }
        else{
            this.highLight = false;
        }
    }

    public boolean clicked(){
        if(highLight && !selected){
            selected = true;
            this.oR = 200;
            this.oG = 0;
            this.oB = 0;
            return true;
        }
        return false;
    }

    public float getX(){
        return x;
    }

    public void deselect(){
        selected = false;
        this.oR = 0;
        this.oG = 0;
        this.oB = 0;
    }

    public float getY(){
        return y;
    }

    public void setSelectedColors(int r, int g, int b){
        this.oR = r;
        this.oG = g;
        this.oB = b;
    }

    public int getRow(){
        return row;
    }
}
