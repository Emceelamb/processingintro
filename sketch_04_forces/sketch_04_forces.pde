int total = 100;
ArrayList<Particle> ps= new ArrayList<Particle>();

void setup() {
  size (800, 800);
  for (int i = 0; i < total; i++) {
    ps.add(new Particle());
  }
}

void draw() {
  background(230);
  PVector wind = new PVector(0.2, 0);
  PVector gravity = new PVector(0, 0.3);
  for (int i = 0; i < ps.size(); i ++) {
    Particle p = ps.get(i);
    if (mousePressed) {
      p.applyForce(wind);
    }
    p.applyForce(gravity);
    p.update();
    p.checkEdges();
    //p.collision();
    p.display();
    if (p.dead()) {
      ps.remove(i);
    }
  }

  //ps.add(new Particle());
}

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float radius;

  int lifespan = 255;

  Particle() {
    location = new PVector(random(width), height/2);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    radius = random(20, 40);
    mass = random(1, 5);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    //lifespan-=2;

    acceleration.mult(0);
  }

  void checkEdges() {
    if (location.x>width || location.x<0) {
      velocity.x*=-1;
    }
    if (location.y>width || location.y<0) {
      velocity.y*=-1;
    }
  }

  void display() {
    stroke(255, 0, 0, lifespan);
    fill(255, lifespan);
    ellipse(location.x, location.y, mass*10, mass*10);
  }

  boolean dead() {
    if (lifespan<0) {
      return true;
    } else {
      return false;
    }
  }

  void collision() {
    for (int i = 0; i <ps.size()-1; i++) {
      Particle p1 =(Particle) ps.get(i);
      for (int j = i+1; j<ps.size(); j++) {
        Particle p2 = ps.get(j);
        float dx = p2.location.x - p1.location.x;
        float dy = p2.location.y - p1.location.y;
        float d = sqrt(sq(dx)+sq(dy));
        if (d < p1.radius/2+p2.radius/2) {
          p1.velocity.mult(-1);
          p2.velocity.mult(-1);
        }
      }
    }
  }
}