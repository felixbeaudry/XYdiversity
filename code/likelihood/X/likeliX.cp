#include <iostream>

#include <stdlib.h>
#include <fstream>

#include <math.h>
#include <time.h>
#include <string>
using namespace std;  //introduces namespace std
long double thetalikeli (long int, long int, long double);
long double divlikeli (long int, long double, long double);
long double factorial(long double);
long double HKAlikeli (long double[52]);

#define LOCI 8978


double drand48(void);
void srand48(long int seedval);



int main( void )
{ ofstream outfile ("likelihoods.txt");  
 
 ifstream infile ("infile.txt");
if (!infile) {
       //print error message to standard error stream:
       cerr << "Can not open input file" << endl;
       exit(1);}
    long double L[LOCI];
    long int SEED;

    long double k[LOCI],maxmaxlik, thetain, kin, maxmaxk[LOCI],d[LOCI], maxmaxtime,maxmaxth[LOCI],kmax[LOCI],scalar[LOCI],th[LOCI],Like, time, maxlik,timemax,thmax[LOCI];
    /*int name, run, start; -mpc */
    long int test, CHAIN, m, w, x, r, p, locus[LOCI], mod, n[LOCI], S[LOCI], y, b, h, zz;
    string locusname[LOCI], locussel[LOCI];

   
   infile >> r; 
             
   infile >> mod;
  
  
   if (mod>0)
   {
   for (zz=0;zz<mod;zz++)
    infile>>
    locussel[zz];
    }
  infile >> time; 
  


   
   
   
   maxlik=-100000000;
  
   
   cout <<" number of loci: " <<r << endl;
  if (mod==0)
   {cout << " neutral model (all k=1)"<<endl;}
 
 
  else 
  
   { if (mod==r)
     { cout<< " error- number of non neutral loci=number of loci!" << endl;
       }
   else
   {
   outfile << " Testing for departure from neutrality at "; 
      
    cout << "Testing for departure from neutrality at ";
     for (m=0;m<mod;m++)
       { outfile<< locussel[m] << ", ";
         cout << locussel[m] << ", ";
       
       }
       
       outfile << endl;
       cout << endl;
  }
  }
  
  maxlik=-1000000000;
   maxmaxlik=-1000000000;
    
    
  
    long int kor;
    kor=0;      

 
   for (h=0; h<r; h++)
     {thmax[h]=0;
    maxmaxth[h]=0;
     k[h]=1;
     
     infile >>locusname[h]>> L[h]>>S[h] >>n[h]>>d[h]>>th[h] >> scalar[h];
     
     for ( test = 0; test < mod; test++ )
     { if ( locusname[h]==locussel[test] )
     {locus[test]=h+1;
     
     }    
  }
}

long int counter,set;
long int numxgenes;
set=1;
counter=0;
Like=0;
  timemax=0;
  long double yscale;
  
  for(yscale=0.001;yscale<2; yscale=(yscale+0.01))
  {
  	
  	for (numxgenes=0; numxgenes<116; numxgenes++)
  	{
  	k[numxgenes]=yscale;
  	}
  for (thetain=0.001; thetain<0.01; thetain=(thetain+0.0001))
  {   Like=0;
  for (w=0; w<r; w++)
 { 
 
 Like = Like+log(thetalikeli(S[w],n[w],(k[w]*L[w]*thetain*scalar[w])));
 
 }
  
  outfile<< yscale << " " << thetain << " " << Like << "\n";
  }
  
  }


}

long double thetalikeli (long int S, long int n, long double T) {  
    
   long int i, x, y, z;
   long double Q,P[500][500],X;
   
   for (i=0; i<(S+1); i++) {  
   
    P[2][i]=(pow ((T/(1+T)),i)) * (1/(1+T));

   }
   
   for (x=3; x<(n+1); x++)
    { for (y=0; y<(S+1); y++)
        { 
        
        X=0;
        for (z=0; z<(y+1); z++)
        
        {
         P[x][y]= X +( P[(x-1)][y-z]*(pow(T/(T-1+x),z))*((x-1)/(x+T-1)));
  		 X=P[x][y];  
  		
        }
      }
      
  }
      
      
	
	Q=P[n][S];
	
	return Q;
    
}

long double divlikeli (long int diverge, long double T, long double tim)



{    

     long double  K, J,C,F,S;

     int r,q;





     K=(T)*(tim);

    

    

    

    C=0;

    for (r=0; r<(diverge+1); r++)

     { 
	 F=0;
	 S=0;
	 for (q=1; q<(r+1); q++)
	 {F=F-log(q);}
	 
	 S=r*((log(K)+log(1+T)-log(T)));
	 
	 C=C+exp(S+F-K);
	 
	 
	

	
	 
	 
	 
	 }

	
J=log(1-(T/(1+T)))+(diverge*(log(T)-log(T+1)))+log(C);
    

    

    

    

 

 if (J==0)

 {cout << "Error, probability of 0!";

 

 exit(1);

 }

 

 else{

   

  return J;

    } 

}




long double factorial(long double numbe) {

	long double temp;

	if(numbe <= 1) return 1;
    
    temp=numbe;
    while (numbe>1)
    {
	temp = temp * (numbe-1);
	numbe=(numbe-1);
	}
	
	return temp;
}
