class Particle {
  PVector location;
  PVector velocity;
  int r;
  

  Particle(PVector location_, PVector velocity_,int r_) {
    location = new PVector(location_.x, location_.y);
    velocity = new PVector(velocity_.x, velocity_.y);
    r = r_;
    
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
  
  void collision(){
  for (int i = 0; i<particles.length-1; i++) {
  Particle p1 = particles[i];
    for (int j = i+1; j<particles.length; j++) {
      Particle p2  = particles[j];
      float dx = p2.location.x - p1.location.x;
      float dy = p2.location.y - p1.location.y;
      float d = sqrt(sq(dx)+sq(dy)); // distance between balls
      if (d < p1.r/2+p2.r/2) {
        p1.velocity.mult(-1);
        p2.velocity.mult(-1);
        fill(random(255),random(255),random(255));
        println("collided!");
      } 
    }
  }
  }
  
  void display() {
    fill(33);
    noStroke();

    ellipse(location.x, location.y, r, r);
  }
}