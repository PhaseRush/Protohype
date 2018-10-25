PImage cookie;
PShape circle;
int clicks;

boolean isDown; //true = click
void setup() {
  textSize(32);
  size(1000, 600);
  fill(100);
  ellipseMode(CENTER);
  imageMode(CENTER);
  cookie = loadImage("ccc.png");
  
  
  circle = createShape(ELLIPSE, 250, 250, cookie.width, cookie.height-3);
  circle.setStroke(color(255));
  circle.setStrokeWeight(0);
}


void draw() {
  background(255);
  
  shape(circle);
  image(cookie,250,250);
  text("clicks: " + clicks, width/2 - 50, height/2 - 120);

  if (!mousePressed || !overlap()) text("owo click me", width/2, height/2 - 150);
  else if (mousePressed && overlap())
    text(">.< stop!!!", width/2, height/2 - 150);
    
  if (mousePressed && !isDown && overlap()) {
    isDown = true;
    clicks++;
  } else if (!mousePressed) isDown = false;
}

boolean overlap() {
  float dx = 250 - mouseX;
  float dy = 250 - mouseY;

  return sqrt(dx*dx + dy*dy) < (cookie.width + cookie.height)/4; //approx.
}
