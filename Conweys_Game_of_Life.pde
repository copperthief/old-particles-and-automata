public static int x = 200;
public static int y = 200;

public static boolean[][] cells;
public static boolean[][] deltaCells;

public static int windowX = 1100;
public static int windowY = 1100;

public static int populationMin = 2;
public static int populationMax = 3;
public static int reproductionNumber = 3;

public static int gen = 0;


void setup() {
  cells = new boolean[x][y];
  
  /*for(int i = 0; i < x; i++) {
    for(int j = 0; j < y; j++) {
      cells[i][j] = false;
    }
  }
  
  cells[0][1] = true;
  cells[1][1] = true;
  cells[2][1] = true;*/
  
  for(int i = 0; i < x; i++) {
    for(int j = 0; j < y; j++) {
      float n = random(1);
      boolean b;
      if (n > .5) {
        b = true;
      } else { b = false; }
      cells[i][j] = b;
    }
  }
  
  size(1100, 1100);
}

void draw() {
  
  deltaCells = new boolean[x][y];
  
  for(int i = 0; i < x; i++) {
    for(int j = 0; j < y; j++) {
      int n = 0;
      
      try {
      if(cells[i-1][j-1] == true) { n++; }
      } catch (ArrayIndexOutOfBoundsException e)  {}
      try {
      if(cells[i][j-1] == true) { n++; }
      } catch (ArrayIndexOutOfBoundsException e)  {}
      try {
      if(cells[i+1][j-1] == true) { n++; }
      } catch (ArrayIndexOutOfBoundsException e)  {}
      try {
      if(cells[i+1][j] == true) { n++; }
      } catch (ArrayIndexOutOfBoundsException e)  {}
      try {
      if(cells[i-1][j] == true) { n++; }
      } catch (ArrayIndexOutOfBoundsException e)  {}
      try {
      if(cells[i+1][j+1] == true) { n++; }
      } catch (ArrayIndexOutOfBoundsException e)  {}
      try {
      if(cells[i][j+1] == true) { n++; }
      } catch (ArrayIndexOutOfBoundsException e)  {}
      try {
      if(cells[i-1][j+1] == true) { n++; }
      } catch (ArrayIndexOutOfBoundsException e)  {}
      
      if      (cells[i][j] == true && n < populationMin) {deltaCells[i][j] = false; }
      else if (cells[i][j] == true && n > populationMax) {deltaCells[i][j] = false; }
      else if (cells[i][j] == false && n == reproductionNumber) {deltaCells[i][j] = true; }
      else deltaCells[i][j] = cells[i][j];
    }
  }
  
  cells = deltaCells;
  
  
  for(int i = 0; i < x; i++) {
    for(int j = 0; j < y; j++) {
      strokeWeight(0);
      if (cells[i][j] == true) {fill(0); } else { fill(255); }
      rect(windowX / x * i, windowY / y * j, windowX / x, windowY/ y);
    }
  }
  
  gen++;
  System.out.println(gen);
  
}
