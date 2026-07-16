int vertex_num = 5*2;
int R;
int R_out = 50;
int R_in = R_out/2;

float x;
float y;

int[] psx = {100, 120, 300, 350, 500};
int[] psy = {40, 300, 90, 250, 150};
int[] psr = new int[5];
int[] psa = new int[5];

void setup() {
  size(1080, 920);
  // fullScreen();
  background(255);
  noStroke();
  frameRate(10);
  for (int i = 0; i < 5; i++) {
    psa[i] = int(random(360));
  }
}

void draw() {
  fill(255);
  rect(0, 0, width, height);
  for (int i = 0; i < 5; i++) {
    psr[i] = int(random(30, 35));
    star(psx[i], psy[i], psr[i], psa[i]);
  }
}


void star(int sx, int sy, int sr, int sa) {
  fill(0);
  pushMatrix();
  translate(sx, sy);
  rotate(radians(sa));
  beginShape();
  R_out = sr;
  R_in = sr/2;
  for (int i = 0; i < vertex_num; i++) {
    if (i%2 == 0) {
      R = R_out;
    } else {
      R = R_in;
    }
    
    x = R * cos(radians(360/vertex_num * i));
    y = R * sin(radians(360/vertex_num * i));
    
    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}
