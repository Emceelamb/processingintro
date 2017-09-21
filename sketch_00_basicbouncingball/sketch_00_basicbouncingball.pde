int x, y;                     // Create global location
int vbounce = int(random(10));           // Bounce  speed
int hbounce = int(random(10));           // Bounce  speed

void setup() {              // Setup functioni
  size(640, 640);          // Create draw window
  background(230);        // Set background color
  x = (width/2);         // Start in middle of screen
  y = (height/2);
}

void draw() {                 // Looping function
  background(230);           // Redraw background

  noStroke();                 // Style Ball
  fill(33);

  ellipse(x, y, 60, 60);    // Draw ball;
  y+=vbounce;
  x+=hbounce;
  if (y > height || y < 0) {
    vbounce *= -1;
  }
  if (x > width || x < 0) {
    hbounce *= -1;
  }
}