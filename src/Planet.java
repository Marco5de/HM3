import java.lang.reflect.Array;
import java.util.ArrayList;

public class Planet {
    String name;
    double mass;
    ArrayList<Vector> r = new ArrayList<>();
    ArrayList<Vector> v = new ArrayList<>();

    public Planet(String name, double mass, double r_x,double r_y, double r_z, double v_x, double v_y, double v_z){
        this.name = name;
        this.mass = mass;
        this.r.add(new Vector(r_x,r_y,r_z));
        this.v.add(new Vector(v_x,v_y,v_z));
    }

    //ToDo make sure deltaT ist in der richtigen größen ORdnung
    // ToDo und ich glaub, dass die zwischenwerte teilweise noch falsche gewählt werden
    void rungeKutta(int counter,ArrayList<Planet> sys,double deltaT){
        Vector kr1 = this.r.get(counter-1);
        Vector kv1 = this.v.get(counter-1);
        Vector ka1 = this.pDOT(sys,counter);

        Vector kr2 = kr1.add(kv1.scale(deltaT/2));
        Vector kv2 = kv1.add(ka1.scale(deltaT/2));
        Vector ka2 = this.pDOT(sys,counter);

        Vector kr3 = kr1.add(kv2.scale(deltaT/2));
        Vector kv3 = kv1.add(ka2.scale(deltaT/2));
        Vector ka3 = this.pDOT(sys,counter);

        Vector kr4 = kr1.add(kv3.scale(deltaT));
        Vector kv4 = kv1.add(ka3.scale(deltaT));
        Vector ka4 = this.pDOT(sys,counter);

        Vector rNew = kr1.add(kv2.scale(2).add(kv3.scale(2)).add(kv4).scale(deltaT/6));
        Vector vNew = kv1.add(ka1.add(ka2.scale(2)).add(ka3.scale(2)).add(ka4).scale(deltaT/6));
        this.r.add(rNew);
        this.v.add(vNew);


    }

    //ToDo änderen der früheren STATISCHEN eigenschaften
    Vector pDOT(ArrayList<Planet> list,int i){
        Vector output = new Vector(0,0,0);
        Planet p = null;
        for(Planet p1 : list) {
            if(this.name.equals(p1.name))
               continue;
            else{
                output.add(forceABS(this,p1,i));
            }
        }
        return output.scale(1/this.mass);
    }

    static Vector forceABS(Planet p1, Planet p2, int i){
        Vector output = p2.r.get(i-1).sub(p1.r.get(i-1));
        double G = 6.674e-20;
        double m1 = p1.mass; double m2 = p2.mass;
        output.scalarMult(G*m1*m2*Math.pow(output.vecAbs(),3));

        return output;
    }

}
