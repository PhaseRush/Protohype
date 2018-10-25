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

void setup() {
  size(1000, 500);
  //rectMode(CORNER);
  sampleSize = 25;
  histogram = new int[sampleSize];
  textSize(32);
  rectY= base*height/(base+1);

  sigma = 5/3;
  mean = 5;
  counter = 0;
}

void draw() {

  if (!mousePressed) {
    clear();
    calculateRandom();
    updateHistogram();

    text("Number of random draws: " + counter, 10, 50);
  }
}

void keyPressed(){
  clear();
  for(int i = 0; i < sampleSize; i++) {
     histogram[i]=0;
     counter = 0;
  }
  
  useGaussian = !useGaussian;
}

void calculateRandom() {
  int randomInteger = (useGaussian)? (int) (randomGaussian()*sigma + sampleSize/2) : (int)random(sampleSize);
  if (randomInteger >= sampleSize || randomInteger < 0) return;
  histogram[randomInteger]++;
}

void updateHistogram() {
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
