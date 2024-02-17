Particle[] particles = new Particle[3];
PVector fieldAtCursor = new PVector(0, 0);

int held = -1;

void setup () {
  size(1000, 1000);
  frameRate(120);
  
  for(int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(1);
  }
  
  particles[0].charge = 9;
  particles[0].pos = new PVector(200, 500);
  particles[1].charge = 36;
  particles[1].pos = new PVector(500, 500);
  particles[2].charge = -4;  
  particles[2].pos = new PVector(300, 500);
}

void draw () {
  background(255, 0, 0);
  for (int i = 0; i < particles.length; i++) {
    //print (i);
  }
  
  if (held != -1) particles[held].pos = new PVector(mouseX, mouseY);
  
  for (int i = 0; i < particles.length; i++) {
    for (int j = 0; j < particles.length; j++) {
      particles[i].interact(particles[j]);
    }
  }
  
  /*
  for (int i = 0; i < particles.length; i++) {
    particles[i].move();
  }
  */
  
  for(int i = 0; i < particles.length; i++) {
    ellipse(particles[i].pos.x, particles[i].pos.y, 20, 20);
  }
  
  //calcFieldAtCursor(particles);
  //line(mouseX, mouseY, mouseX + 50000 * fieldAtCursor.x, mouseY + 50000 * fieldAtCursor.y);
}

void mouseClicked() {
  if(held == -1) {
    for(int i = 0; i < particles.length; i++) {
      if(PVector.sub(new PVector(mouseX, mouseY), particles[i].pos).mag() < 10) {
        held = i;
      }
    }
  } else { held = -1; }
}


 public void calcFieldAtCursor(Particle[] ps) {
   fieldAtCursor = new PVector(0, 0);
     for(int i = 0; i < ps.length; i++) {
        PVector diff = PVector.sub(new PVector(mouseX, mouseY), ps[i].pos);
        float dist = diff.mag();
        if (dist != 0) {
            PVector dir = diff.normalize();
            fieldAtCursor.add(dir.mult(ps[i].charge / (dist * dist)));
        }
    }
 }
