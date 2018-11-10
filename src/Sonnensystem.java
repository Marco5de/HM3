import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Sonnensystem {
    private static final int MAX_YEARS = 50;
    private static final int MAX_POINTS = 100;
    private static  ArrayList<Planet> sonnensys = new ArrayList<>();

    private static FileWriter fw = null;
    private static BufferedWriter bw = null;
    private static File path = new File("output.csv");

    public static void main(String args[]) throws IOException {
        sonnensys = init();
        fw = new FileWriter(path);
        bw = new BufferedWriter(fw);

        for(Planet p : sonnensys)
            System.out.println(p.name);

        int numberOfFrames = (int)(60 * 600);
        double deltaT = 10 * 365 * 24 * 60*60 / numberOfFrames;

        int counter = 1;
        while(counter < numberOfFrames){
            for(Planet p : sonnensys){
                p.rungeKutta(counter,sonnensys,counter);
            }
            for(Planet p: sonnensys) {
                try {
                    String str = String.format( "%f, %f, %f\n",p.r.get(counter).x,p.r.get(counter).y,p.r.get(counter).z);
                    bw.write(str);
                    bw.flush();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            counter++;
        }
        bw.close();

    }


    static ArrayList<Planet> init(){
        ArrayList<Planet> out = new ArrayList<>();
        final String path = "Sonnensystem.dat";
        File file = new File(path);
        List<String> input = new ArrayList<>();
        Scanner inputstream;

        try{
            inputstream = new Scanner(file);
            while(inputstream.hasNext()){
                String current = inputstream.next();
                input.add(current);
            }
            inputstream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        for(int i=0; i<80; i+=8){
            //System.out.println(input.get(i));
            out.add(new Planet(input.get(i),Double.valueOf(input.get(i+1)), Double.valueOf(input.get(i+2)), Double.valueOf(input.get(i+3)),
                    Double.valueOf(input.get(i+4)),Double.valueOf(input.get(i+5)),Double.valueOf(input.get(i+6)),Double.valueOf(input.get(i+7))));
        }

        return out;
    }


}