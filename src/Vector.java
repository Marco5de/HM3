
public class Vector {
    public double x;
    public double y;
    public double z;

    public Vector(double x, double y, double z){
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public double vecAbs(){
        return Math.sqrt(x*x + y*y + z*z);
    }

    public Vector add(Vector v){
        return new Vector(this.x+v.x,this.y+v.y,this.z+v.z);
    }

    public Vector sub(Vector v){
        return new Vector(this.x-v.x,this.y-v.y,this.z-v.z);
    }

    public void scalarMult(double c){
        this.x *= c;
        this.y *= c;
        this.z *= c;
    }

    public Vector scale(double c){
        return new Vector(this.x*c,this.y*c,this.z*c);
    }

}
