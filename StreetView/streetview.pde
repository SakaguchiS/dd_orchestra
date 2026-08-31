PImage tower;
PImage house1;
PImage house2;

float offset = 0;
float speed = 2;

void setup() {
  size(1000, 600);

  tower = loadImage("塔.png");
  house1 = loadImage("民家.png");
  house2 = loadImage("民家（２）.png");
}

void draw() {
  background(220);

  offset -= speed;

  // 無限スクロール
  if (offset < -1200) {
    offset = 0;
  }

  // 地面
  fill(100);
  rect(0, height-100, width, 100);

  // 街並み
  image(house1, offset, 200, 220, 300);
  image(house2, offset+220, 150, 300, 350);
  image(tower,  offset+520, 50, 180, 500);
  image(house1, offset+720, 200, 220, 300);
  image(house2, offset+940, 150, 300, 350);

  // 画面外に出た時用（2セット目）
  image(house1, offset+1200, 200, 220, 300);
  image(house2, offset+1420, 150, 300, 350);
  image(tower,  offset+1720, 50, 180, 500);
}
