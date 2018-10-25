PShape e;
int clicks;
boolean isDown; //true = click
void setup() {
  textSize(32);
  size(1000, 600);
  fill(100);
  ellipseMode(CENTER);
  e = createShape(ELLIPSE, 250, 250, 200, 200);
  e.setStroke(color(255));
  e.setStrokeWeight(4);
}

void draw() {
  clear();
  shape(e);
  text("clicks: " + clicks, width/2 - 50, height/2 - 120);

  if (!mousePressed || !overlap()) text("owo click me", width/2, height/2 - 150);
  else if (mousePressed && overlap())
    text(">.< stop!!!", width/2, height/2 - 150);
  
  
  if (mousePressed && !isDown && overlap()) {
    e.setFill(color(204, 153, 0));
    isDown = true;
    clicks++;
  } else if (!mousePressed && isDown) {
    e.setFill(color(#000000));
    isDown = false;
  }
}

boolean overlap() {
  float dx = 250 - mouseX;
  float dy = 250 - mouseY;

  return sqrt(dx*dx + dy*dy) < 100;
}
void mouseClicked() {
  e.setFill(color(random(.2)));
}
