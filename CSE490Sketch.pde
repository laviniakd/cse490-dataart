PImage bg1;
PImage bg2;
PImage bg3;
int s;
int pointHalf;
boolean[] pressed;
int[] m1x;
int[] m2x;
int[] m1y;
int[] m2y;

void setup() {
  size(749, 768);
  bg1 = loadImage("newcentaur.jpg");
  bg2 = loadImage("newnewcentaur.jpg");
  bg3 = loadImage("statement.jpg");
  s = 10;
  pointHalf = 8;
  pressed = new boolean[pointHalf];
  m1x = new int[]{252, 700, 70, 50, 600, 239, 468, 245};
  m1y = new int[]{30, 500, 95, 280, 550, 700, 200, 330};
  m2x = new int[]{90, 320, 670, 220, 421, 367, 677, 640};
  m2y = new int[]{700, 570, 230, 670, 676, 20, 690, 650};
}

void draw() {
  noStroke();
  background(bg1);
  
  drawMatchPoints(m1x,m1y);
  drawMatchPoints(m2x,m2y);
  
  stroke(255);
  if (mousePressed == true) {
    int x = mouseX;
    int y = mouseY;
    for (int k = 0; k < pointHalf; k++) {
      if (check(x, y, k, true)) {
        line(m1x[k], m1y[k], m2x[k], m2y[k]);
        pressed[k] = true;
      } else if (check(x, y, k, false)) {
        line(m1x[k], m1y[k], m2x[k], m2y[k]);
        pressed[k] = true;
      }
    }
  }
  boolean d = true;
  for (int i = 0; i < pointHalf; i++) {
      if (!pressed[i]) {
        d = false;
      }
  }
  if (d == true) {
    for (int p = 0; p < pointHalf; p++) {
      stroke(255);
      line(m1x[p], m1y[p], m2x[p], m2y[p]);
    }
    background(bg2);
    for (int p = 0; p < pointHalf; p++) {
      stroke(#0FF5A2);
      line(m1x[p], m1y[p], m2x[p], m2y[p]);
    }
  }
  if ((mousePressed == true) && (mouseX > 300) && (mouseX < 500) && (mouseY > 300) && (mouseY < 500)) {
      background(bg3);
  }
    
}

void drawMatchPoints(int[] m1, int[] m2) {
  for (int i = 0; i < pointHalf; i++) {
    ellipse(m1[i], m2[i], s, s);
  }
}

boolean check(int x, int y, int k, boolean b) {
  if (b) {
    return (x > m1x[k] - 2*s && x < m1x[k] + 2*s) && (y > m1y[k] - 2*s && y < m1y[k] + 2*s);
  } else {
    return (x > m2x[k] - 2*s && x < m2x[k] + 2*s) && (y > m2y[k] - 2*s && y < m2y[k] + 2*s);
  }
}
