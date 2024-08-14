









//import de.bezier.data.sql.*;

//import java.lang.*;
import java.util.*;
//import java.time.*;
import controlP5.*;
import processing.serial.*;

Serial myPort;
float heading = 0.0;
float altitude = 0.0;




double Hc;
double Z;

//SQLite db;
ControlP5 controlP5;
ControlP5 cp5;
int Latitude_1 = 39;
int Lat_minutes = 24;
int Lat_seconds = 52;
int Longitude_1 = -77;
int Lon_minutes = 24;
int Lon_seconds = 37;
int Zone = 4;  ////Time zone correction
double GMST = 0;
double LMST = 0;
double Lon = 0;
double Lat = 0;
double ra = 0;
float RA = 0;
double dec = 0;
double ma = 0; //Meridian angle
String starName = " ";

ScrollableList Name1;
ScrollableList Name2;
String Star1 = "Rasalhague";
String Star2 = "Polaris";
int z = 73;
int j = 25;
 double GHAaries = 0;
 double GAST = 0;
 double GHA = 0;
 double SHA = 0;

 
 
 double GHA1 = 0;
 double GHA2 = 0;
 double dec1 = 0;
 double dec2 = 0;
 double alt1 = 0;
 double alt2 = 0;
 double azi1 = 0;
 double azi2 = 0;
 double t12 = 0;
 double alt12 = 0;
 double A = 0;
 double B = 0;
 double Par1 = 0;
 double Par2 = 0;
 double t1 = 0;
 double t2 = 0;
 double Lat1 = 0;
 double Lat2 = 0;
 double Lon1 = 0;
 double Lon2 = 0;
 
 double Az = 0;
 double Alt = 0;
 double[] Fix;

 PFont f; 

void setup() {
  
  size(1200, 750);
  
    printArray(Serial.list());

  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil(10);  //(10);
  
  f = createFont("Arial",16,true);
     controlP5 = new ControlP5(this);
      cp5 = new ControlP5(this);
             List l = Arrays.asList("Procyon","Rasalhague","Dubhe", "Mirphak", "Alkaid","Altair", "Alioth", "Spica", "Betelgeuse", "Capella", "Vega","Polaris", "Menkalinan", "Pollux", "Regulus","Deneb", "Denebola");
  /* add a ScrollableList, by default it behaves like a DropdownList */
//  Name1 = cp5.addScrollableList("StarName  1")
    Name1 = cp5.addScrollableList("Star1")
     .setPosition(20, 270)
     .setSize(200, 200)
     .setBarHeight(40)
     .setItemHeight(40)
     .addItems(l)
     // .setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
     ;
 

     controlP5.addSlider("Latitude_1",0,90,Latitude_1,20,10,255,20);
     controlP5.addSlider("Lat_minutes",0,60,Lat_minutes,20,40,255,20);
     controlP5.addSlider("Lat_seconds",0,60,Lat_seconds,20,70,255,20);
    
     controlP5.addSlider("Longitude_1",-180,180,Longitude_1,20,110,255,20);
     controlP5.addSlider("Lon_minutes",0,60,Lon_minutes,20,140,255,20);
     controlP5.addSlider("Lon_seconds",0,60,Lon_seconds,20,170,255,20);

     
      // Name2 = cp5.addScrollableList("StarName  2")
        Name2 = cp5.addScrollableList("Star2")
    // .setPosition(20, 390)
       .setPosition(600, 270)
     .setSize(200, 200)
     .setBarHeight(40)
     .setItemHeight(40)
     .addItems(l)
    ; 


}

void draw() {
  background(240);
  
  

  
  
    Lat = (float)Latitude_1 + (float)Lat_minutes/60 + (float)Lat_seconds/3600;  //Estimated Latitude
    Lon = (float)Longitude_1 - (float)Lon_minutes/60 - (float)Lon_seconds/3600; //Estimated Longitude
   
   if (Longitude_1 > 0) {
   Lon = (float)Longitude_1 + (float)Lon_minutes/60 + (float)Lon_seconds/3600; //East of Greenwich
   }
// println(Star1);
   Star1 = Name1.getCaptionLabel().getText();
         if (Star1 == "Procyon") { 
 z = 47;
}
         if (Star1 == "Rasalhague") { 
 z = 93;
}
         if (Star1 == "Dubhe") { 
 z = 57;
}
         if (Star1 == "Mirphak") { 
 z = 18;
}
         if (Star1 == "Alkaid") { 
 z = 73;
} 
        if (Star1 == "Altair") { 
 z = 104;
} 
        if (Star1 == "Alioth") { 
 z = 68;
} 
        if (Star1 == "Spica") { 
 z = 71;
}
        if (Star1 == "Betelgeuse") { 
 z = 36;
}
        if (Star1 == "Capella") { 
 z = 25;
}
        if (Star1 == "Vega") { 
 z = 98;
}
        if (Star1 == "Polaris") { 
 z = 14;
}
        if (Star1 == "Menkalinan") { 
 z = 37;
}
        if (Star1 == "Pollux") { 
 z = 48;
}
        if (Star1 == "Regulus") { 
 z = 54;
}
        if (Star1 == "Deneb") { 
 z = 108;
}
        if (Star1 == "Denebola") { 
 z = 108;
}




//println(Star2);
   Star2 = Name2.getCaptionLabel().getText();
         if (Star2 == "Procyon") { 
 j = 47;
}
         if (Star2 == "Rasalhague") { 
 j = 93;
}
         if (Star2 == "Dubhe") { 
 j = 57;
}
         if (Star2 == "Mirphak") { 
 j = 18;
}
         if (Star2 == "Alkaid") { 
 j = 73;
} 
        if (Star2 == "Altair") { 
 j = 104;
}
        if (Star2 == "Alioth") { 
 j = 68;
} 
        if (Star2 == "Spica") { 
 j = 71;
}
        if (Star2 == "Betelgeuse") { 
 j = 36;
}
        if (Star2 == "Capella") { 
 j = 25;
}
        if (Star2 == "Vega") { 
 j = 98;
}
        if (Star2 == "Polaris") { 
 j = 14;
}
        if (Star2 == "Menkalinan") { 
 j = 37;
}
        if (Star2 == "Pollux") { 
 j = 48;
}
        if (Star2 == "Regulus") { 
 j = 54;
}
        if (Star2 == "Deneb") { 
 j = 108;
}
        if (Star2 == "Denebola") { 
 j = 108;
}



//System.out.println(z + "   " + Star1);
//System.out.println(j + "   " + Star2);
//thread(); 
 SiderealTime();
 CalcAstro();
   AltitudeAzimuth( Math.toRadians(GHA1), Math.toRadians(dec1), Math.toRadians(Lat), Math.toRadians(-Lon));
/////////println("     GHA: ",GHA1);
/////////println("     Dec: ",dec1);
/////////println("  Zenith:  ",90 - Hc);
/////////println("Altitude:  ", Hc);
/////////println(" Azimuth:  ", Z);
double H1 = Hc;

  AltitudeAzimuth( Math.toRadians(GHA2), Math.toRadians(dec2), Math.toRadians(Lat), Math.toRadians(-Lon));
/////////println("     GHA: ",GHA2);
/////////println("     Dec: ",dec2);
//////// println("  Zenith:  ",90 - Hc);
/////////println("Altitude:  ", Hc);
/////////println(" Azimuth:  ", Z);
double H2 = Hc;
 
 t12 = GHA2 - GHA1;  //combined polar meridian angle

alt12 = alt(t12,dec1,dec2);
A = (azi(dec2,dec1,Math.toDegrees(alt12)));
//B = (azi(alt2,alt1,Math.toDegrees(alt12)));
B = (azi(H2,H1,Math.toDegrees(alt12)));

Par1 = A - B; 

Par2 = A + B;
/*
Lat1 = alt(Math.toDegrees(Par1),dec1,alt1);
Lat2 = alt(Math.toDegrees(Par2),dec1,alt1);
t1 = azi(alt1,dec1,Math.toDegrees(Lat1));
t2 = azi(alt1,dec1,Math.toDegrees(Lat2));
Lon1 = GHA1 - Math.toDegrees(t1);
Lon2 = GHA1 - Math.toDegrees(t2); */

Lat1 = alt(Math.toDegrees(Par1),dec1,H1);
Lat2 = alt(Math.toDegrees(Par2),dec1,H1);
t1 = azi(H1,dec1,Math.toDegrees(Lat1));
t2 = azi(H1,dec1,Math.toDegrees(Lat2));
Lon1 = GHA1 - Math.toDegrees(t1);
Lon2 = GHA1 - Math.toDegrees(t2);

//println(Math.toDegrees(Lat1) + "  " + + Lon1); 
//println(Math.toDegrees(Lat2) + "  " + Lon2);
String Position1Lat = new Double(Math.toDegrees(Lat1)).toString();
String Position1Lon = new Double(-Lon1).toString();
String Position2Lat = new Double(Math.toDegrees(Lat2)).toString();
String Position2Lon = new Double(-Lon2).toString();

String Altitude1 = new Double(alt1).toString();
//String Altitude1 = new Double(dec1).toString();
//String Altitude2 = new Double(dec2).toString();
String Altitude2 = new Double(alt2).toString();
String Azimuth1 = new Double(azi1).toString();
String Azimuth2 = new Double(azi2).toString();
String GHA01 = new Double(GHA1).toString();
String GHA02 = new Double(GHA2).toString();

String Meridian = new Double(Math.toDegrees(t1)).toString();

  
  

  
  textFont(f);       
  fill(0);

  textAlign(LEFT);
  //text("This text is centered.",width/4,550);
    text("   Assumed Latitude:  " + Lat,20,215);
  text("Assumed Longitude: " + Lon,20,230);
 text("Pick Fix from these Possible Positions",width/8,530);
 text("Position1: "+"Latitude= " + Position1Lat + " Longitude= " + Position1Lon,width/8,550);
 text("Position2: "+"Latitude= " + Position2Lat + " Longitude= " + Position2Lon,width/8,570);

 text("Star1 Altitude: " + Altitude1,250,290);
  text("Star1 Azimuth: " + Azimuth1,250,310);
  text("Meridian Angle: " + Meridian,250,330);
  text("                GHA: " + GHA01,250,350);
 text("Star2 Altitude: " + Altitude2,250,410);
 text("Star2 Azimuth: " + Azimuth2,250,430);
 text("                 GHA: " + GHA02,250,450);
 
 
 
 



 
 
 
   
}





void CalcAstro() {
 
//  ArrayList results = new ArrayList();
   double hour = (GMST)/15;

     





          
 String[] starLines = loadStrings("stardata.csv");
/////////////println("Loaded " + starLines.length + " stars:");

                for (int i = 0 ; i < starLines.length; i++) {
if(i == z || i == j) {          

  double deci = hour - (int)hour;
  double min = deci * 60;
  double sec = (min - (int)min) * 60;
  
  
    String[] stars = splitTokens(starLines[i], ", ");
  String proper = (stars[0]);
  String con = (stars[1]);
  double dec = float(stars[2]);
  double ra = float(stars[3]);
  double pmra = float(stars[4]);
  double pmdec = float(stars[5]);
  double rv = float(stars[6]);
//  starName = proper;

if (ra > 12){
ra = -(24 - ra); 
}
  
  ra = ra * 15; 
  
  
  double h = Math.sin(Math.toRadians(Lat)) * Math.sin(Math.toRadians(dec)) + Math.cos(Math.toRadians(Lat)) * Math.cos(Math.toRadians(dec)) * Math.cos(Math.toRadians( ra - (GMST)));

h = Math.asin(h);

double Az = (Math.sin(Math.toRadians(dec)) - Math.sin(h) * Math.sin(Math.toRadians(Lat)))/(Math.cos(h) * Math.cos(Math.toRadians(Lat)));
Az = Math.acos(Az);




ma = Math.acos (Math.sin((h)) - Math.sin(Math.toRadians(Lat)) * Math.sin(Math.toRadians(dec))/( Math.cos(Math.toRadians(Lat)) * Math.cos(Math.toRadians(dec))) );




double H = Math.toDegrees(h);
H = H - (int)H;
H = H * 60;

  SHA = 360 - ra;
  if (SHA > 360.0) SHA = (SHA - 360.0);
 // println("SHA: ",SHA);
GHA = SHA + GHAaries;

while(GHA > 360){
  GHA = GHA - 360;
  
}
//println("GHA: ", GHA);
//Star1 = Name1.getCaptionLabel().getText();
//Star2 = Name2.getCaptionLabel().getText();
//if (Star1.equals(proper)){
  
GHA1 = GHA; //Denebola
dec1 = dec; 
alt1 = Math.toDegrees(h);
azi1 = Math.toDegrees(Az);
if (GHA1 < 180) {
azi1 = 360 - azi1;
}  
//println(i + " " + proper + ": " + GHA1 + " " + dec1 + " " + (alt1));




//}
if ( j == i) {
 Star2 = (proper);
  
GHA2 = GHA; 
dec2 =  dec; 
alt2 = Math.toDegrees(h);
azi2 = Math.toDegrees(Az); 
//println(i + " " + proper + ": " + GHA2 + " " + dec2 + " " + (alt2));





}

}
    
  
//return results; }

}
}





 double SiderealTime(){

  Date OldDate = new Date("01/01/2000");
  Date TodaysDate = new Date();
///////////  println(TodaysDate);
  long mills_per_day = 1000*60*60*24;
  long day_diff = (TodaysDate.getTime() - OldDate.getTime())/mills_per_day;

  double dfrac = map(hour()+ Zone + norm(minute(),0,60)+ norm(second(), 0, 3600) ,0,24f,0,24f);
// println(dfrac); 
  double UT = dfrac;

// println(UT);
  dfrac = dfrac/24; // - (5/24);
//println(dfrac);
  double JD = day_diff + dfrac - 0.5 +  2451545;
//println(JD);
  double dwhole = (367*year()-(int)(7*(year()+(int)((month()+9)/12))/4) + (int)(275*month()/9)+day()-730531.5);

  double SD = dwhole + dfrac;
 //   double T = (JD + UT/24 - 2451545.0)/36525;
//  double Theta0 = 280.46061837 + 360.98564736629 * (JD - 2451545.0) + (0.000387933 * (T * T)) - ((T * T * T)/38710000); 
//double Theta = Theta0 + Lon;
//println(Lon);


   GMST = 280.46061837 +( 360.98564746629 * (SD)) + Lon;
//  println("GMST: ",GMST);

//double LMST = GMST - (-77.461f);
double LMST = GMST + Lon/15f;// GMST - (Lon);
//println("LMST: ",LMST);
  GMST = (((GMST/360) - (int)GMST/360)*360);
  double T = 367 * year() - (int)(1.75 * (year() + (int)((month()+9)/12))) + (int)(275 * month()/9) + day() + UT/24 - 730531.5; 
  GHAaries = 0.9856474 * T + 15 * UT + 100.46062;
/////////////  println("GHAaries: ",GHAaries);
  GHAaries = (((GHAaries/360) - (int)GHAaries/360)*360);
///////////  println("GHAaries: ",GHAaries);
  double SHA = 360.0 - 15 * ra;
  GAST = GHAaries/15f;
//////////  println("GAST: ",GAST);
  GHA = SHA + GHAaries;
  if (GHA > 360.0)GHA = GHA - 360.0;
//  println("GHA: ", GHA);
//  println("Declination: ",dec2);
  

  
//println("Julian:  " + JD); 


 return GMST;
}

public double azi(double x, double y, double z){
    x = Math.toRadians(x);
   y = Math.toRadians(y);
    z = Math.toRadians(z);
  
  Az = (Math.sin(x) - Math.sin(y) * Math.sin(z))/(Math.cos(y) * Math.cos(z));
  Az = Math.acos(Az);
  
/////////////  println("Azi: ",Math.toDegrees(Az));
  
  return Az;
}

public double alt(double a, double b, double c) {
  a = Math.toRadians(a);
   b = Math.toRadians(b);
    c = Math.toRadians(c);
  
  Alt = (Math.cos((a)) * Math.cos(b) * Math.cos(c)) + (Math.sin(b) * Math.sin(c));
  Alt = Math.asin(Alt);
///////// println("Alt: ",Math.toDegrees(Alt)); 
  return Alt;
}

public double[] fix(double GHA1, double GHA2) {
 double t12 = 0;
 
 
 return Fix;
}

double Mod(double x[]) {

  return(Math.sqrt(x[0] * x[0] + x[1] * x[1] + x[2] * x[2]));
  
}

double[] Add(double x[], double y[]) {
  double z[] = new double[3];
  for (int i = 0; i < 3; i++) {
       z[i] = x[i] + y[i];
      } 
 
 return   z ;  
 }
 
 double[] aVector(double a, double x[]) {
   double z[] = new double[3];
   z[0] = a * x[0];
   z[1] = a * x[1];
   z[2] = a * x[2];
   
   return (z);
   
 }
 
 double[] Unit(double x[]) {
   
   return (aVector(1.0/Mod(x),x));
   
 }
 
 double Dot(double x[], double y[])
 {
   return (x[0]*y[0]+x[1]*y[1]+x[2]*y[2]);
   
 }
 
 double[] Cross(double x[], double y[]){
  
   double z[] = new double[3];
   z[0] = (x[1]*y[2]) - (x[2]*y[1]);
   z[1] = (x[2]*y[0]) - (x[0]*y[2]);
   z[2] = (x[0]*y[1]) - (x[1]*y[0]);
   
   return (z);
   
 }
 
 double[] VectorSpherical2Cartesian(double B, double L){
  
   double v[] = new double[3];
   v[0] = Math.cos(B) * Math.cos(L);
   v[1] = Math.cos(B) * Math.sin(L);
   v[2] = Math.sin(B);
//   println(B);
//   println(L);
   return(v);
   
 }
 
 void AltitudeAzimuth(double GHA, double dec, double Be, double Le){
  
   double GP[];
   double AP[];
   double Np[] = {0,0,1};
 //  double Np[] = {1,0,0};
   
   double U1[],U2[],U3[],Az[];
   
   GP = VectorSpherical2Cartesian(dec,GHA);
   

  
   AP = VectorSpherical2Cartesian(Be,Le);
//    println("AP  : ",AP[0]," ",AP[1]," ",AP[2]);

  Hc = 90.0 - Math.toDegrees(Math.acos(Dot(AP,GP)));
//  println((Hc));
  
  
   U1 = Unit(Cross(AP,Np));
//     println("U1  : ",U1[0]," ",U1[1]," ",U1[2]);

   U2 = Cross(U1,AP);
//   println("U2  : ",U2[0]," ",U2[1]," ",U2[2]);
   
   U3 = Unit(Cross(AP,GP));
//    println("U3  : ",U3[0]," ",U3[1]," ",U3[2]);
    
   Az = Cross(U3,AP);
//   println("Az  : ",Az[0]," ",Az[1]," ",Az[2]);
   
   Z = Math.toDegrees(Math.acos(Dot(U2,Az)));
  
 //  println(Math.toDegrees(Math.acos(Dot(U1,Az))));
   if(Dot(U1,Az) < 0.0) {
    Z = 360.0 - Z;
    
   }

//   println(Z);
 }
 
 void serialEvent (Serial myPort)
{
  String inString = myPort.readStringUntil(10);  //(10);

  if (inString != null)
  {
    println(inString);
    String[] list = split(inString,' '); //'\n'); //','); // ' '); //'\n');
    heading = float(list[0]);
    altitude = float(list[1]);
    println(heading, altitude);
  }  
}
