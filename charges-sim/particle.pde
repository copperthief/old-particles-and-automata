class Particle {
  Particle(int charge) { this.charge = charge; }
  
  public int charge;
  
  public PVector acc = new PVector(0, 0);
  public PVector vel = new PVector(0, 0);
  public PVector pos = new PVector(0, 0);
  
  public void interact(Particle p) {
    PVector diff = PVector.sub(this.pos, p.pos);
    //print(diff);
    float dist = diff.mag();
    //print(dist);
    if (dist != 0) {
      PVector dir = diff.normalize();
      //print(dir);
      this.acc.add(dir.mult(this.charge * p.charge / (dist * dist)));
      //print(acc);
    }
    //println(" ");
  }
  
  public void move() {
    vel.add(acc);
    pos.add(vel);
    
    acc = new PVector(0, 0);
  }
}
