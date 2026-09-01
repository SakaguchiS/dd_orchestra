import processing.sound.*;
import gifAnimation.*;

Amplitude amp; // 音を扱うライブラリをインスタンス化
AudioIn in; // 入力音声

Gif bird_l; // 左向きの鳥gif
Gif bird_r; // 右向きの鳥gif

int bgc = 100; // 背景色の初期値
boolean b = false; // 鳥アニメーション開始フラグ
float birdx = width + 2000; // 鳥x座標初期値
float birdy = height + 600; // 鳥y座標初期値
float speed = -5; // 鳥の横方向の移動速度
boolean turn = true; // 鳥の向き変更フラグ
int depth = 200; // 鳥がUターンする際の奥行き変化量

int alp = 0; // 光の線の色の初期値
boolean sound = false; // 音量検出フラグ
float [] lim = new float[45]; // 光の大きさ
int ptn = 0; // 光の配置パターン切替用変数


void bird () {
  int time = millis()/1000; // 1秒ごとにカウントアップ
  background(bgc); // birdに切り替えた時の背景色
  noStroke();
  bgc++; // 背景色を徐々に白くする
  if (bgc > 255) {
    bgc = 255;
  }

  if (turn) {
    image(bird_l, birdx, birdy, 750, 300); // 左向きの鳥表示
  } else {
    image(bird_r, birdx, birdy, 300, 120); // 右向きの鳥表示
  }

  birdx += speed; // 鳥のx座標変化

  if (time%2 == 1) {
    birdy += -0.5; // 1秒ごとに鳥のy座標変化（少し上下に動かす）
  }

  if (birdx < -540 || birdx > 2200) { // 鳥が枠外に出た時
    speed = -speed; // 鳥の移動方向を反転
    turn = !turn; // 鳥の向きを反転
    depth = -depth; // 鳥の奥行き感変更
    birdy += depth; // 鳥の奥行き感変更
  }

  float volume = amp.analyze(); // 音量取得
  if (volume > 0.01) { // 音量が0.01より大きいとき
    alp = 0; // 光の線の色を黒色にする
    sound = true; // 音量検出
  }
  if (sound) { // 音量検出されているとき
    stroke(alp); // 光の線の色設定
    if (ptn == 0) { // 光の配置パターン0
      for (int i = 0; i < 10; i++) {
        sparkle(lix[i], liy[i], lim[i]);
      }
    } else if (ptn == 1) { // 光の配置パターン1
      for (int i = 5; i < 25; i++) {
        sparkle(lix[i], liy[i], lim[i]);
      }
    } else if (ptn == 2) { // 光の配置パターン2
      for (int i = 10; i < 35; i++) {
        sparkle(lix[i], liy[i], lim[i]);
      }
    } else { // 光の配置パターン3
      for (int i = 15; i < 45; i++) {
        sparkle(lix[i], liy[i], lim[i]);
      }
    }
  }
  alp+=3; // 光の線の色を徐々に白くする（フェードアウト）
  if (alp == 255) { // 光がフェードアウトしきったとき
    sound = false; // 音量検出なし状態に切り替える
    ptn++; // 光の配置パターンを切り替える
    if (ptn > 3) {
      ptn = 0;
    }
  }
}

// 六角形x3の光の描画
void sparkle (float x, float y, float m) {
  strokeWeight(3);
  single_sparkle(x, y, m);
  single_sparkle(x-50, y+50, m);
  single_sparkle(x+50, y+100, m);
}

// 六角形x1の光の描画
void single_sparkle(float xx, float yy, float mm) {
  beginShape();
  noFill();
  vertex(xx, yy);
  vertex(xx, yy - 40*mm);
  vertex(xx + 15*mm, yy - 50*mm);
  vertex(xx + 30*mm, yy - 40*mm);
  vertex(xx + 30*mm, yy);
  vertex(xx + 15*mm, yy + 10*mm);
  endShape(CLOSE);
}
