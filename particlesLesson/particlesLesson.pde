Particle[] particles = new Particle[10];
void setup() {
  size(640, 640);
  background(230);
  for (int i = 0; i <particles.length; i++) {
    particles[i] = new Particle(new PVector(random(width), random(height)));
  }
}

void draw() {
  background(230);
  for (Particle p : particles) {
    p.checkEdges();
    p.update();
    p.display();
  }
}

class Particle {
  PVector location;
  PVector velocity;

  Particle(PVector location_) {
    location = new PVector(location_.x, location_.y);
    velocity = new PVector(1, 1);
  }

  void update() {
    location.add(velocity);
  }

  void checkEdges() {
    if (location.x>width||location.x<0) {
      velocity.x*=-1;
    }
    if (location.y>height||location.y<0) {
      velocity.y*=-1;
    }
  }

  void display() {
    fill(33);
    noStroke();

    ellipse(location.x, location.y, 60, 60);
  }
}