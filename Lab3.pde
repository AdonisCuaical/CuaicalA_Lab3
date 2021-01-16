import processing.serial.*; 
int pts=0; 
String dato; 
int x1=0; 
int posx; 
int posy; 
float rb; 
int x2=0; 
int aux=0;
int vx=1; 
int vy; 
int cont=0;  
boolean t=false; 
boolean t1=false; 
int mat [][]=new int [8][15]; 
float r; 
int au=0; 
int au1=0; 
float re; 
float g; 
float b; 

Serial port; 
void setup() {
  for (int i=0; i<8; i++) {
    for (int j=0; j<15; j++) {
      mat[i][j]=1;
    }
  }
  port=new Serial(this, "COM10", 9600);
  size(800, 600);
  stroke(255);
  background(0);
  strokeWeight(8);
  fill(0); 
  rect(0, 0, 800, 600); 
  strokeWeight(5); 
  line(100, 100, 800, 100); 
  stroke(255);
  strokeWeight(5); 
  line(100, 100, 100, 600);
  stroke(255);
  strokeWeight(5); 
  line(0, 0, 100, 100);
  textSize(32);
  fill(0, 102, 153);
  text("BREAKOUT", 350, 70); 
  String lines = "P\nu\nn\nt\na\nj\ne\n.. \n ";
  textSize(32);
  fill(0, 102, 153);  // Set fill to black
  textLeading(40);  // Set leading to 10
  text(lines, 35, 125);
  textSize(32);
  fill(0, 102, 153);
  text(pts, 35, 500);
  bloques();
  noStroke();
  posx=(width+100)/2; 
  posy=(height+100)/2+100;
}
void draw() {

  player();
  ball(); 
  velocidad(); 
  choque(); 
  choqueBloques();
  choqueParedes(); 
  //fill(0); 
  //rect(((width-100)/2+x1), 566, 200, 30);
}
void bloques() {
  for (int j=125; j<800; j+=50) {
    for (int i=120; i<380; i+=40) {
      re=random(1, 255);
      g=random(1, 255); 
      b=random(1, 255); 
      stroke(0); 
      strokeWeight(2);
      fill(re, g, b); 
      rect(j-25, i-20, 50, 40 );
      stroke(255);
      strokeWeight(5); 
      line(800, 0, 800, 600);
      cont++;
    }
  }
} 
void player() {
  fill(0); 
  rect(10, 566, 800, 30);
  fill(#B4ADD8); 
  rect(((height)/2+x1+100), 566, 100, 30);
}
void serialEvent(Serial port) {
  dato=port.readString();
  print(dato); 
  switch(dato) {
  case "I": 
    aux=x1; 
    x1=x1-30; 
    if ((height)/2+x1+100<90) {
      x1=350;
    }
    break;
  case "D": 
    aux=x1; 
    x1=x1+30; 
    if ((height)/2+x1+100>800) {
      x1=-300;
    }
    break;
  }
}
void ball() {
  stroke(0); 
  fill(0); 
  posx=posx+vx; 

  posy= posy+vy; 

  // ellipse(posx-1, posy-1, 20, 20);
  fill(random(0, 255), random(0, 255), random(0, 255)); 
  ellipse(posx, posy, 20, 20);
}
void velocidad() {

  if (t1==false) {
    vx=1;
  } else if (t1==true) {
    vx=-1;
  }
  if (t==false) {
    vy=1;
  } else if (t==true)
  {
    vy=-1;
  }  
  delay(100);
}
void choque() {
  for (int j=0; j<100; j++) {
    r=pow(pow(posx-((height)/2+x1+100+j), 2)+pow( posy-566, 2), 0.5); 
    //println(r); 
    if (r<5 || posy==0) {
      t=true;
    }
  }
}
void choqueBloques() {
  for (int i=1; i<8; i++) {
    for (int j=1; j<15; j++) {
      if (mat[i][j]==1) {
        rb=pow(pow(posx-(j*50+100), 2)+pow(posy-(i*40+100), 2), 0.5);
        println(rb); 
        if (rb<20) {
          t=false; 
          mat[i][j]=0; 
          noStroke(); 
          fill(0); 
          rect(j*50+100-50, i*40+100-40, 50, 40 );
        }
      }
    }
  }
}
void choqueParedes() {
  if (posx>790 ) {
    t1=true;
    print(t1);
  }
  if (posx<110) {
    t1=false;
  }
  if (posy<110) {
    t=false;
  }
}
