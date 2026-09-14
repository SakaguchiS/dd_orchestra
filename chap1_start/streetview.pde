PImage tower;
PImage house1;
PImage house2;
PImage palace;

float offset = 0;
float speed = 2.0;

// 街1セットの長さ
float cityWidth = 1550;

boolean c = false; // 建物アニメーション開始フラグ

void streetview() {

  background(220);

  offset -= speed;

  if (offset <= -cityWidth) {
    offset += cityWidth;
  }

  // 地面
  fill(0);
  rect(width/2, height/2, width, 100);

  drawCity(offset);
  drawCity(offset + cityWidth);
}

void drawCity(float x) {

  float h1 = 180;
  float h2 = 240;
  float ht = 380;
  float hp = 400;

  image(house1, x + 0,
        height/2 - h1,
        140, h1);

  image(house2, x + 160,
        height/2 - h2,
        300, h2);

  image(tower, x + 490,
        height/2 - ht,
        100, ht);

  image(palace, x + 600,
        height/2 - hp,
        450, hp);

  image(tower, x + 1060,
        height/2 - ht,
        100, ht);

  image(house2, x + 1200,
        height/2 - h2,
        300, h2);
}
