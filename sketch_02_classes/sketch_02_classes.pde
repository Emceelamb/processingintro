Particle particle;
void setup() {              // Setup functioni
  size(640, 640);          // Create draw window
  background(230);  // Set background color

  particle = new Particle(new PVector(random(width),random(height)));

}

void draw() {                 // Looping function
  background(230);           // Redraw background
  particle.update();
  particle.checkEdges();
  particle.display();
}

class Particle {
  // Now each variable is only available locally
  PVector location;        // Ball Location
  PVector velocity;        // bounce speed

  Particle(PVector location_) {
    location = location_;
    velocity = new PVector(2, 2);    // changing bounce speed to a vector
  }

  void update() {
    location.add(velocity);    // vector math
  }

  void checkEdges() {
    // Check ball location & change ball velocity

    if (location.x > width || location.x < 0) {
      velocity.x *= -1;
    }
    if (location.y > height || location.y < 0) {
      velocity.y *= -1;
    }
  }

  void display() {

    noStroke();                 // Style Ball
    fill(33);

    ellipse(location.x, location.y, 60, 60);    // Draw ball;
  }
}