data {
  int<lower=1> T;                // 試行数
  array[T] int<lower=0, upper=1> action; // 選択 (0:A, 1:B)
  array[T] int<lower=0, upper=1> reward; // 報酬 (0:外れ, 1:当たり)
}

parameters {
  real<lower=0, upper=1> alpha;  // 学習率
  real<lower=0> beta;           // 逆転温度 (Softmaxの逆温度)
}

model {
  // 以前のQ値を保持する変数
  vector[2] Q = [0.5, 0.5]';

  for (t in 1:T) {
    target += bernoulli_logit_lpmf(action[t] | beta * (Q[2] - Q[1]));

    // Q値の更新 (選んだ方だけ更新)
    int chosen = action[t] + 1; // 0,1 を 1,2 に変換
    real pe = reward[t] - Q[chosen]; // 予測誤差 (Prediction Error)
    Q[chosen] = Q[chosen] + alpha * pe;
  }
}
