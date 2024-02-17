
//public static final float G =.0000000000667;
public static final float G = 1;

Particle[] particles = new Particle[1];

void setup () {
  size(1000,1000);
  frameRate(30);
  
  for(int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(1, 1);
  }
}

void draw () {
  for(int i = 0; i < particles.length; i++) {
    particles[i].go();
  }
}
