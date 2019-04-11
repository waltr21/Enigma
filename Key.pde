public class Key{
    float diameter, x, y;
    char letter;
    int r,g,b;
    boolean highLight, pressed;

    public Key(float x, float y, char c){
        this.diameter = 55;
        this.x = x;
        this.y = y;
        this.letter = c;
        this.r = 150;
        this.g = 150;
        this.b = 150;
        this.highLight = false;
        this.pressed = false;
    }

    /**
     * Display the current key.
     */
    public void show(){
        highLight();
        if(highLight || pressed){
            this.r = 255;
            this.g = 245;
            this.b = 109;
        }
        else{
            this.r = 150;
            this.g = 150;
            this.b = 150;
        }
        pushMatrix();
        //Translate the center point to be at the x,y coord for this object.
        translate(x, y);
        //Thickness of the outline
        strokeWeight(3);
        //Color of the outline
        stroke(0,0,0);
        //Don't fill the circle
        fill(r, g, b);
        //Draw the circle from its center point
        ellipseMode(CENTER);
        //Draw a circle at x,y with width and height of size
        ellipse(0, 0, diameter, diameter);
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

    public void highLight(){
        if (dist(x, y, mouseX, mouseY) < diameter/2){
            this.highLight = true;
        }
        else{
            this.highLight = false;
        }
    }

    public void setHighlight(boolean b){
        pressed = b;
    }

    public boolean clicked(){
        if(highLight || pressed){
            return true;
        }
        return false;
    }
}
