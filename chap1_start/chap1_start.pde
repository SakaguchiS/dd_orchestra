void setup() {
  size(1920, 1200);
  // fullScreen();
  background(255);
  rectMode(CENTER);
  
  for(int i = 0; i < 45; i++) {
    lix[i] = random(width);
    liy[i] = random(height);
    lim[i] = random(3);
  }
  
  bird_l = new Gif(this, "bird_l.gif");
  bird_l.loop();
  bird_r = new Gif(this, "bird_r.gif");
  bird_r.loop();
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw() {
  if (start) {
    curtain();
  }
  if (a) {
    spotlights();
  }
  if (b) {
    bird();
  }
}

void keyPressed() {
  if (key == ENTER) {
    start = !start;
  }
  if (key == 'a') {
    a = !a;
  }
  if (key == 'b') {
    b = !b;
  }
}
