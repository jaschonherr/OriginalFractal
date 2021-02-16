public int fractalCt = 8;
public int myLim = 16;
public int rMod = (int)(Math.random() * 255);
public int gMod = (int)(Math.random() * 255);
public int bMod = (int)(Math.random() * 255);
Fractal[] fractals = new Fractal[fractalCt];

public void setup() {
  size(800, 800);
  for(int i = 0; i < fractalCt; i++) {
    fractals[i] = new Fractal(i * (width/fractalCt) + (width/fractalCt)/2, i * (width/fractalCt) + (width/fractalCt)/2, width/fractalCt, -4);
  }
}

public void draw() {
  background(0);
  for(int i = 0; i < fractalCt; i++) {
    fractals[i].show();
    fractals[i].move();
  }
}

void keyPressed() {
  if(key == 'd') {
    if(myLim > 16) {
      myLim = myLim/2;
    }
  }
  if(key == 'a') {
    if(myLim < 128) {
      myLim = myLim*2;
    }
  }
}
class Fractal {

  private float myX, myY, mySiz, mySpeed;
  private int myR, myG, myB;
  
  public Fractal(float x, float y, float siz, float spd) {
    myX = x;
    myY = y;
    mySiz = siz;
    mySpeed = spd;
    myR = 255;
    myG = 255;
    myB = 255;
  }
  
  public void build(float x, float y, float siz) {
    noFill();
    strokeWeight(1);
    stroke(myR, myG, myB);
    ellipse(x, y, siz, siz);
    if(siz > myLim) {
      build(x - siz/4, y, siz/2);
      build(x + siz/4, y, siz/2);
      build(x, y - siz/4, siz/2);
      build(x, y + siz/4, siz/2);
    }
  } 
  
  public void show() {
    build(myX, myY, mySiz);
  }
  
  public void move() {
    myY += mySpeed;
    if(myY + mySiz/2 > 800 || myY - mySiz/2 < 0) {
      mySpeed = -mySpeed;
      myR -= rMod;
      if(myR < 0) {
        myR += 255;
      }
      myG -= gMod;
      if(myG < 0) {
        myG += 255;
      }
      myB -= bMod;
      if(myB < 0) {
        myB += 255;
      }
    }
  }
}


