float x; // 家のx座標
float y; // 家のy座標
float houseSize = 100; // 家の大きさ

float offsetX; // 家のx軸移動量
float offsetY; // 家のy軸移動量

boolean selected = false; // ドラッグ操作フラグ

void setup() {
  size(1920, 1200);
  rectMode(CENTER);

  x = width / 2;
  y = height / 2;
}

void draw() {
  background(255);

  fill(0);
  noStroke();

  house(x, y, houseSize); // 家の描画
}

void house(float x, float y, float h) { // 家を描画する関数
  rect(x, y, h, h);
  triangle(x, y-h-h/6, x-h/2-h/4, y-h/2, x+h/2+h/4, y-h/2);
}

void mousePressed() {
  float distance = dist(mouseX, mouseY, x, y);

  // 家の上をクリックしたか確認
  if (distance < houseSize / 2) {
    selected = true;

    offsetX = x - mouseX; // マウスの移動量を計算
    offsetY = y - mouseY; // マウスの移動量を計算
  }
}

void mouseDragged() {
  // 家が選択されている場合だけ移動
  if (selected) {
    x = mouseX + offsetX; // マウスの移動量だけ家を移動
    y = mouseY + offsetY; // マウスの移動量だけ家を移動
  }
}

void mouseReleased() {
  selected = false; // マウスドラッグをやめたらフラグをfalseに
}

void keyPressed() {
  if (key == CODED) {
    if(keyCode == UP) { // 上矢印キーで家を大きく
      houseSize += 10;
    } else if (keyCode == DOWN) { // 下矢印キーで家を小さく
      houseSize -= 10;
    }
  }
}
