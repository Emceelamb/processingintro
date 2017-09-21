class Particle {
  // Now each variable is only available locally
  PVector location;        // Ball Location
  PVector velocity;    // bounce speed
  int lifespan = 255;
  float radius;


  Particle(PVector location_) {
    location = location_;
    velocity = new PVector(random(5), random(5));    // changing bounce speed to a vector
    radius = random(30, 60);
  }

  void update() {
    location.add(velocity);    // vector math
    lifespan--;
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



  boolean isDead() {
    if (lifespan<0.0) {
      println("hey youre dead!");
      return true;
    } else {
      return false;
    }
  }



  void display() {

    noStroke();                 // Style Ball
    fill(33, lifespan);

    ellipse(location.x, location.y, radius, radius);    // Draw ball;
  }

  void run() {    // this keyword refers to the current object
    this.update();
    this.checkEdges();
    this.display();
  }
}