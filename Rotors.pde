public class Rotors{
    Rotor[] allRotors;
    Rotor reflector;

    public Rotors(){
        allRotors = new Rotor[3];
        allRotors[0] = new Rotor();
        allRotors[1] = new Rotor();
        allRotors[2] = new Rotor();
        reflector = new Rotor();
        setRotors();
    }

    public char feedRotors(char c){
        int index = charToInt(c);
        for (Rotor r : allRotors){
            index = r.getScrambleF(index);
        }
        index = reflector.getScrambleF(index);
        for(int i = allRotors.length-1; i >= 0; i--){
            Rotor r = allRotors[i];
            index = r.getScrambleB(index);
        }

        return intToChar(index);
    }

    public void setRotors(){
        //Rotor #1:
        allRotors[0].setWire(0,charToInt('J'));
        allRotors[0].setWire(1,charToInt('G'));
        allRotors[0].setWire(2,charToInt('D'));
        allRotors[0].setWire(3,charToInt('Q'));
        allRotors[0].setWire(4,charToInt('O'));
        allRotors[0].setWire(5,charToInt('X'));
        allRotors[0].setWire(6,charToInt('U'));
        allRotors[0].setWire(7,charToInt('S'));
        allRotors[0].setWire(8,charToInt('C'));
        allRotors[0].setWire(9,charToInt('A'));
        allRotors[0].setWire(10,charToInt('M'));
        allRotors[0].setWire(11,charToInt('I'));
        allRotors[0].setWire(12,charToInt('F'));
        allRotors[0].setWire(13,charToInt('R'));
        allRotors[0].setWire(14,charToInt('V'));
        allRotors[0].setWire(15,charToInt('T'));
        allRotors[0].setWire(16,charToInt('P'));
        allRotors[0].setWire(17,charToInt('N'));
        allRotors[0].setWire(18,charToInt('E'));
        allRotors[0].setWire(19,charToInt('W'));
        allRotors[0].setWire(20,charToInt('K'));
        allRotors[0].setWire(21,charToInt('B'));
        allRotors[0].setWire(22,charToInt('L'));
        allRotors[0].setWire(23,charToInt('Z'));
        allRotors[0].setWire(24,charToInt('Y'));
        allRotors[0].setWire(25,charToInt('H'));

        //Rotor #2
        allRotors[1].setWire(0,3);
        allRotors[1].setWire(1,14);
        allRotors[1].setWire(2,1);
        allRotors[1].setWire(3,10);
        allRotors[1].setWire(4,18);
        allRotors[1].setWire(5,21);
        allRotors[1].setWire(6,15);
        allRotors[1].setWire(7,11);
        allRotors[1].setWire(8,17);
        allRotors[1].setWire(9,12);
        allRotors[1].setWire(10,23);
        allRotors[1].setWire(11,24);
        allRotors[1].setWire(12,7);
        allRotors[1].setWire(13,13);
        allRotors[1].setWire(14,9);
        allRotors[1].setWire(15,16);
        allRotors[1].setWire(16,25);
        allRotors[1].setWire(17,2);
        allRotors[1].setWire(18,4);
        allRotors[1].setWire(19,6);
        allRotors[1].setWire(20,20);
        allRotors[1].setWire(21,8);
        allRotors[1].setWire(22,5);
        allRotors[1].setWire(23,22);
        allRotors[1].setWire(24,0);
        allRotors[1].setWire(25,19);
        //
        // //Rotor #3
        allRotors[2].setWire(0,15);
        allRotors[2].setWire(1,5);
        allRotors[2].setWire(2,7);
        allRotors[2].setWire(3,25);
        allRotors[2].setWire(4,24);
        allRotors[2].setWire(5,1);
        allRotors[2].setWire(6,17);
        allRotors[2].setWire(7,9);
        allRotors[2].setWire(8,0);
        allRotors[2].setWire(9,20);
        allRotors[2].setWire(10,4);
        allRotors[2].setWire(11,23);
        allRotors[2].setWire(12,14);
        allRotors[2].setWire(13,11);
        allRotors[2].setWire(14,2);
        allRotors[2].setWire(15,19);
        allRotors[2].setWire(16,3);
        allRotors[2].setWire(17,8);
        allRotors[2].setWire(18,12);
        allRotors[2].setWire(19,16);
        allRotors[2].setWire(20,22);
        allRotors[2].setWire(21,13);
        allRotors[2].setWire(22,18);
        allRotors[2].setWire(23,21);
        allRotors[2].setWire(24,6);
        allRotors[2].setWire(25,10);

        reflector.setWire(0,17);
        reflector.setWire(17,0);

        reflector.setWire(1,6);
        reflector.setWire(6,1);

        reflector.setWire(2,25);
        reflector.setWire(25,2);

        reflector.setWire(3,11);
        reflector.setWire(11,3);

        reflector.setWire(4,5);
        reflector.setWire(5,4);

        reflector.setWire(7,22);
        reflector.setWire(22,7);

        reflector.setWire(8,10);
        reflector.setWire(10,8);

        reflector.setWire(9,20);
        reflector.setWire(20,9);

        reflector.setWire(12,15);
        reflector.setWire(15,12);

        reflector.setWire(13,19);
        reflector.setWire(19,13);

        reflector.setWire(14,24);
        reflector.setWire(24,14);

        reflector.setWire(16,18);
        reflector.setWire(18,16);

        reflector.setWire(23,21);
        reflector.setWire(21,23);






        // ArrayList<Integer> nums = new ArrayList<Integer>();
        // for(int i = 0; i < 26; i++){
        //     nums.add(i);
        // }
        //
        // for(int i = 0; i < 26; i++){
        //     int rand = int(random((nums.size())));
        //     // nums.remove(Integer.valueOf(nums.get(rand)));
        //     System.out.println("allRotors[1].setWire(" + i + "," + nums.get(rand) + ");");
        //     nums.remove(Integer.valueOf(nums.get(rand)));
        //
        // }
    }

    public int charToInt(char c){
        String alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        c = Character.toUpperCase(c);

        for (int i = 0; i < alph.length(); i++){
            if (alph.charAt(i) == c){
                // System.out.println("Transcoding: " + c + " ---> " + i);
                return i;
            }
        }
        return -1;
    }

    public char intToChar(int i){
        String alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        return alph.charAt(i);
    }

    public void show(){
        float tempLength = (60 * allRotors.length-1) + (20 * allRotors.length);
        float startX = 50;
        float startY = 50;
        for (int i = allRotors.length-1; i >= 0; i--){
            allRotors[i].show(startX, startY);
            startX += 60;
        }
    }

    public void increment(){
        for (Rotor r : allRotors){
            if (!r.increment()){
                return;
            }
        }
    }


    public void decrement(){
        for (Rotor r : allRotors){
            if (!r.decrement()){
                return;
            }
        }
    }

    public void checkLeftClick(){
        for (Rotor r : allRotors){
            r.leftClick();
        }
    }

    public void checkRightClick(){
        for (Rotor r : allRotors){
            r.rightClick();
        }
    }


}

class Rotor{
    int[] wires;
    int curIndex;
    boolean hover;

    public Rotor(){
        wires = new int[26];
        curIndex = 0;
        hover = false;
    }

    public boolean increment(){
        curIndex++;
        if (curIndex > 25){
            curIndex = 0;
            return true;
        }
        return false;
    }

    public boolean decrement(){
        curIndex--;
        if (curIndex < 0){
            curIndex = 25;
            return true;
        }
        return false;
    }

    public void setWire(int i, int val){
        wires[i] = val;
    }

    public int getScrambleF(int index){
        // System.out.println("Transcoding F: " + index + " ---> " + wires[(index + curIndex)%26]);
        return wires[(index + curIndex)%26];
    }

    public int getScrambleB(int val){
        for(int i = 0; i < wires.length; i++){
            if (wires[(i + curIndex)%26] == val){
                // System.out.println("Transcoding B: " + val + " ---> " + i);

                return i;
            }
        }
        return -1;
    }

    public void show(float x, float y){
        fill(255);
        hover = false;
        if (dist(mouseX, mouseY, x, y) <= 30){
            fill(252, 252, 60);
            hover = true;
        }
        textSize(40);
        text(curIndex + "", x, y);
    }

    public void leftClick(){
        if (hover){
            increment();
        }
    }

    public void rightClick(){
        if (hover){
            decrement();
        }
    }

}
