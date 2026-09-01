float[] lix = new float[45]; // 灯火のx座標
float[] liy = new float[45]; // 灯火のy座標
boolean a = false; // 灯火の開始フラグ
int r = 0; // 灯火の直径
int expand = 1; // 灯火の直径の変化量
int pattern = 0; // 灯火の配置パターン切替用変数


void spotlights () {
  fill(255, 40);
  if (pattern == 0) {
    for (int i = 0; i < 15; i++) {
      ellipse(lix[i], liy[i], r, r);
    }
  } else if (pattern == 1) {
    for (int i = 15; i < 30; i++) {
      ellipse(lix[i], liy[i], r, r);
    }
  } else if (pattern == 2) {
    for (int i = 30; i < 45; i++) {
      ellipse(lix[i], liy[i], r, r);
    }
  }
  r += expand;
  if (r > 200 || r < 0) { // 灯火の直径は0〜200の間で往復
    expand = -expand;
  }
  if (r < 0) { // 灯火の直径が1往復するごとに配置パターンを切り替える
    pattern++;
    if (pattern > 2) {
      pattern = 0;
    }
  }
}
