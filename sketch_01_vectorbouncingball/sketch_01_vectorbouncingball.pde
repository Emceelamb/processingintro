int x, y;                     // Create global location
PVector location;        // Ball Location
PVector velocity;        // bounce speed

void setup() {              // Setup functioni
  size(640, 640);          // Create draw window
  background(230);        // Set background color
  x = (width/2);         // Start in middle of screen
  y = (height/2);
  location = new PVector(random(10), random(10));
  velocity = new PVector(2, 2);    // changing bounce speed to a vector
}

void draw() {                 // Looping function
  background(230);           // Redraw background

  noStroke();                 // Style Ball
  fill(33);

  ellipse(location.x, location.y, 60, 60);    // Draw ball;

  location.add(velocity);    // vector math

  // Check ball location & change ball velocity

  if (location.x > width || location.x < 0) {
    velocity.x *= -1;
  }
  if (location.y > height || location.y < 0) {
    velocity.y *= -1;
  }
}