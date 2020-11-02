/* 
Title: Barnsley Fern Christmas Card
Author: Elijah Ko
Contact: h.ko18@imperial.ac.uk / elijah.ko@network.rca.ac.uk 
Date: 2020-10-30

Description:
Fractals Everywhere! This time we apply matrix transformation on a fern called black spleenwort. Inspired by the work of British mathematician, Michael Barnsley.

Reference:
https://en.wikipedia.org/wiki/Barnsley_fern
*/

boolean recording = false;

float x = 0;
float y = 0;

void setup() {
  size(750, 750, P2D);
  background(20, 140, 65);
}

void BarnsleyFern() {
  float nextX;
  float nextY;

  float r = random(1);

  if (r < 0.1) {
    /*
    ƒ1
    xn + 1 = 0
    yn + 1 = 0.16 yn
    */
    nextX = 0;
    nextY = 0.16 * y;
  } else if (r < 0.86) {
    /*
    ƒ2
    xn + 1 = 0.85 xn + 0.04 yn
    yn + 1 = −0.04 xn + 0.85 yn + 1.6.
    */
    nextX = 0.85 * x + 0.04 * y;
    nextY = -0.04 * x + 0.85 * y + 1.6;
  } else if (r < 0.93) {
    /*
    ƒ3
    xn + 1 = 0.2 xn − 0.26 yn
    yn + 1 = 0.23 xn + 0.22 yn + 1.6
    */
    nextX = 0.2 * x + -0.26 * y;
    nextY = 0.23 * x + 0.22 * y + 1.6;
  } else {
    /*
    ƒ4
    xn + 1 = −0.15 xn + 0.28 yn
    yn + 1 = 0.26 xn + 0.24 yn + 0.44
    */
    nextX = -0.15 * x + 0.28 * y;
    nextY = 0.26 * x + 0.24 * y + 0.44;
  }

  x = nextX;
  y = nextY;
}

void ThelypteridaceaeFern() {
  float nextX;
  float nextY;

  float r = random(1);

  if (r < 0.02) {
    nextX = 0;
    nextY = 0.25 * y - 0.4;
  } else if (r < 0.86) {
    nextX = 0.95 * x + 0.005 * y - 0.002;
    nextY = -0.005 * x + 0.93 * y + 0.5;
  } else if (r < 0.93) {
    nextX = 0.035 * x + -0.2 * y - 0.09;
    nextY = 0.16 * x + 0.04 * y + 0.02;
  } else {
    nextX = -0.04 * x + 0.2 * y + 0.083;
    nextY = 0.16 * x + 0.04 * y + 0.12;
  }

  x = nextX;
  y = nextY;
}

void drawPoint() {
  stroke(255);
  strokeWeight(1);

  /* 
  −2.1820 < x < 2.6558
        0 ≤ y < 9.9983
  */
  float px = map(x, -2.182, 2.6558, 0, width);
  float py = map(y, 0, 9.9983, height, 0);
  point(px, py);
}

void draw() {
  // translate(0, -30); //comment out for Thelypteridaceae fern
  for (int i = 0; i < 500; i++) {
    drawPoint();
    BarnsleyFern();
    // ThelypteridaceaeFern();
  }
  savingFrame();
}

void savingFrame() {
  if (recording) {
    saveFrame("ChristmasCardBarnsleyFern/CCBF_####.png");
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    recording = !recording;
  }
}
