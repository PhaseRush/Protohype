import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class RandomDigitsHistogram extends PApplet {

int[] histogram;
int sampleSize;
int maxWidth = width;
int maxHeight = height;
int base = 7;
int rectY;
int counter;
boolean drawText = false;
boolean useGaussian = false;

float sigma, mean;

public void setup() {
  
  //rectMode(CORNER);
  sampleSize = 25;
  histogram = new int[sampleSize];
  textSize(32);
  rectY= base*height/(base+1);

  sigma = 5/3;
  mean = 5;
  counter = 0;
}

public void draw() {

  if (!mousePressed) {
    clear();
    calculateRandom();
    updateHistogram();

    text("Number of random draws: " + counter, 10, 50);
  }
}

public void keyPressed(){
  clear();
  for(int i = 0; i < sampleSize; i++) {
     histogram[i]=0;
     counter = 0;
  }
  
  useGaussian = !useGaussian;
}

public void calculateRandom() {
  int randomInteger = (useGaussian)? (int) (randomGaussian()*sigma + sampleSize/2) : (int)random(sampleSize);
  if (randomInteger >= sampleSize || randomInteger < 0) return;
  histogram[randomInteger]++;
}

public void updateHistogram() {
  for (int i = 0; i < sampleSize; i++) {
    int xPos = i*width/(2*sampleSize) + 200;
    rect(xPos, rectY, width/(2*sampleSize), -histogram[i]*sampleSize/10);
    if (drawText) {
      fill(128, 128, 128);
      text(histogram[i], xPos, rectY-20);
      fill(255);
      text(i, xPos, rectY + 20);
    }
  }
  counter++;
}
  public void settings() {  size(1000, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "RandomDigitsHistogram" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
