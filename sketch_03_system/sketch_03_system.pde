int total = 50;
ArrayList<Particle> plist = new ArrayList<Particle>();

Particle particle[];
void setup() {              // Setup functioni
  size(640, 640);          // Create draw window
  background(230);  // Set background color

  for (int i = 0; i <total; i++) {
    plist.add(new Particle(new PVector(random(width), random(height))));
  }
}

void draw() {                 // Looping function
  background(230);           // Redraw background

  for(int i = plist.size()-1; i>=0;i--){
    Particle p = (Particle) plist.get(i);
    p.run();
    if(p.isDead()){
      plist.remove(i);
    }
  }


}

void mouseMoved(){
  plist.add(new Particle(new PVector(mouseX,mouseY)));
}