int w = 0; // 幕の幅
boolean start = false; // 幕開けの開始フラグ

void curtain () {
  fill(0, 20);
  noStroke();
  rect(width/2, height/2, w, height);
  if (w <= width) {
    w += 5; // 幕開けの速さ
  }
}
