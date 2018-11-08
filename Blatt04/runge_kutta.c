#include <stdio.h>
#include <math.h>

double runge_kutta(double deltaT, double y0, double t0, double (*phi)(double,double));

/*******************************************************************************
*
* USER CAN DEFINE HIS/HER OWN FUNCTION BELOW
* 
********************************************************************************/
double phi(double t, double y){
	return 1 - y*y;
}


/********************************************************************************
* PROGRAM READS COMMANDLINE VARIABLES AS INPUT
* 1st: double deltaT as stepwidth
* 2nd: double y0 as starting point
* 3rd: double t0 as starting point
* 4th: double t_final endpoint 
*
* MATH LIBARY MUST BE LINKED WHEN BUILDING THE EXECUTEABLE
* UNDER LINUX USE gcc -Wall -o runge_kutta runge_kutta.c -lm
* use $ time ./output.out for time measurement
*
* program writes result in file
********************************************************************************/

int main(int argc, char **argv){
	
	printf("DeltaT stepwidth: %s\n",argv[1]);
	printf("y0 starting point: %s\n",argv[2]);
	printf("t0 as starting point: %s\n",argv[3]);
	printf("t_final endpoint: %s\n",argv[4]);
	

	//not handling any errors that may occur
	double deltaT = atof(argv[1]);
	double y0 = atof(argv[2]);
	double t0 = atof(argv[3]);
	double t_final = atof(argv[4]);
	//compute how many values there are between startpoint t0 and endpoint t_final
	int max = 1 + (t_final - t0) / deltaT; 
	
	double (*funcptr)(double,double);
	funcptr = &phi;
	
	printf("%10c   %10c\n\n",'t','y');
	
	printf("%10.2f   %10.2f\n",t0,y0);
	
	FILE *f = fopen("kuttaoutput.txt","w");



	double y_output[max];

	fprintf(f,"%f,%f\n",t0,y0);
	// i is the current iteration 
	y_output[0] = y0;
	for(int i = 1; i < max; i++){
		y_output[i] = runge_kutta(deltaT, y_output[i-1],t0,funcptr);	
		printf("%10.2f    %10.2f\n",t0+deltaT,y_output[i]);
		t0 += deltaT;
		fprintf(f,"%f,%f\n",t0,y_output[i]);	
	}
	fclose(f);

}
/*
* Computation of the next point y_i+1
* algorithm as defined in the describtion	
*/
double runge_kutta(double deltaT, double y0, double t0, double (*phi)(double,double)){
	double k1 = (*phi)(t0,y0);
	double k2 = (*phi)(t0 + 0.5 * deltaT, y0 + 0.5 * deltaT * k1);
	double k3 = (*phi)(t0 + 0.5 * deltaT, y0 + 0.5 * deltaT * k2);
	double k4 = (*phi)(t0 + deltaT, y0 + k3 * deltaT);

	return y0 + (k1/6 + k2/3 + k3/3 + k4/6) * deltaT;
}
