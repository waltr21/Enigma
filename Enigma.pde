import java.util.ArrayList;

Key[] keys;
PlugKey[] plugKeys;
String outPut, input;
ArrayList<PlugKey> selectedPlugs;
ArrayList<Connection> connections;
float connectionGap = 35;
Rotors rotors;

public void setup(){
    size(1200, 800, P2D);
    smooth(4);
    keys = new Key[26];
    plugKeys = new PlugKey[26];
    initKeys();
    outPut = "";
    input = "";
    selectedPlugs = new ArrayList<PlugKey>();
    connections = new ArrayList<Connection>();
    rotors = new Rotors();
}

private void initKeys(){
    //Init for the keyboard
    String allLetters = "QWERTYUIOPASDFGHJKLZXCVBNM";
    float rowSize = (9*55) + (9*20);
    float xPos = (width-rowSize)/2.0;
    float yPos = height * 1/3;
    for (int i = 0; i < allLetters.length(); i++){
        keys[i] = new Key(xPos, yPos, allLetters.charAt(i));
        xPos += 75;
        if (allLetters.charAt(i) == 'P'){
            yPos += 75;
            rowSize = (8*55) + (8*20);
            xPos = (width-rowSize)/2;
        }
        if (allLetters.charAt(i) == 'L'){
            yPos += 75;
            rowSize = (6*55) + (6*20);
            xPos = (width-rowSize)/2;
        }
    }

    //Init for the plug board
    allLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    rowSize = (12*55) + (12*20);
    xPos = (width-rowSize)/2.0;
    yPos = height * 6/9.0;
    int row = 0;
    for (int i = 0; i < allLetters.length(); i++){
        plugKeys[i] = new PlugKey(xPos, yPos, allLetters.charAt(i), row);
        xPos += 75;
        if (allLetters.charAt(i) == 'M'){
            yPos += height*.15;
            xPos = (width-rowSize)/2;
            row = 1;
        }
    }


}

private void showKeys(){
    for (Key k : keys){
        k.show();
    }

    for (PlugKey k : plugKeys){
        k.show();
    }
}

public void draw(){
    background(57);
    showConnections();
    showKeys();
    showText();
    rotors.show();
    // line(width/2, 0, width/2, height);
}

public void showText(){
    fill(76, 247, 142);
    textAlign(CENTER, CENTER);
    textSize(30);
    text(input, width/2, 125);
    fill(239, 189, 103);
    text(outPut, width/2, 175);
    textSize(20);
    fill(255);
    text("Press the \'/\' key to remove the last made connection.", width/2, height-30);
}

public void mouseClicked(){
    for (Key k : keys){
        if(k.clicked()){
            scramble(k.letter);
        }
    }

    if (mouseButton == LEFT) {
        rotors.checkLeftClick();
    }
    else if (mouseButton == RIGHT) {
        rotors.checkRightClick();
    }

    selectPlug();
}

private void scramble(char k){
    input += Character.toLowerCase(k);
    k = plugSwap(k);
    k = rotors.feedRotors(k);
    k = plugSwap(k);
    outPut += k;
    rotors.increment();
}

private char plugSwap(char k){
    for(Connection c : connections){
        if (c.getK1().letter == k){
            k = Character.toUpperCase(c.getK2().letter);
        }
        else if (c.getK2().letter == k){
            k = Character.toUpperCase(c.getK1().letter);
        }
    }
    return k;
}

private void selectPlug(){
    for (PlugKey k : plugKeys){
        if(k.clicked()){
            if (!checkValidConnection(k)){
                return;
            }
            selectedPlugs.add(k);

            if (selectedPlugs.size() == 2){
                connections.add(new Connection(selectedPlugs.get(0), selectedPlugs.get(1)));
                connectionGap += 5;
                selectedPlugs.clear();
            }
            return;
        }
    }
    deselectPlugs();
}

private void deselectPlugs(){
    for (PlugKey pk : selectedPlugs){
        pk.deselect();
    }
    selectedPlugs.clear();
}

private boolean checkValidConnection(PlugKey pk){
    if(selectedPlugs.size() == 1){
        if (pk == selectedPlugs.get(0)){
            deselectPlugs();
            return false;
        }
    }
    for (Connection c : connections){
        if(pk == c.getK1() || pk == c.getK2()){
            deselectPlugs();
            return false;
        }
    }
    return true;
}

public void keyReleased(){
    char pressedKey = Character.toUpperCase(key);
    for (Key k : keys){
        if (k.letter == pressedKey){
            k.setHighlight(false);
        }
    }

}

private void showConnections(){
    for (Connection c : connections){
        c.show();
    }
}

public void keyPressed(){
    char pressedKey = Character.toUpperCase(key);
    for (Key k : keys){
        if (k.letter == pressedKey){
            k.setHighlight(true);
            if (k.clicked()){
                scramble(k.letter);
            }
        }
    }

    if (key == '/'){
        removeLastConnection();
    }

    if (keyCode == 8 && outPut.length() > 0){
        outPut = outPut.substring(0, outPut.length()-1);
        input = input.substring(0, input.length()-1);
        rotors.decrement();
    }

    // System.out.println(keyCode);
}

private void removeLastConnection(){
    if (connections.size() > 0){
        Connection c = connections.get(connections.size()-1);
        c.getK1().deselect();
        c.getK2().deselect();
        connections.remove(c);
        connectionGap -= 5;
    }
}
