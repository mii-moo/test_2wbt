library(tidyverse)
library(ggplot2)
library(cmdstanr)
library(tidybayes)
library(bayesplot)

raw_text <- '

'

raw_text_1 <- '
"response","variable","reward","trial_index","subject_id"
"0","setting","high-low-high-low-high","1","test1"
"0","a","","2","test1"
"null","r","1","3","test1"
"0","a","","4","test1"
"null","r","1","5","test1"
"0","a","","6","test1"
"null","r","0","7","test1"
"0","a","","8","test1"
"null","r","1","9","test1"
"0","a","","10","test1"
"null","r","1","11","test1"
"0","a","","12","test1"
"null","r","1","13","test1"
"0","a","","14","test1"
"null","r","0","15","test1"
"0","a","","16","test1"
"null","r","1","17","test1"
"0","a","","18","test1"
"null","r","1","19","test1"
"0","a","","20","test1"
"null","r","1","21","test1"
"0","a","","22","test1"
"null","r","1","23","test1"
"0","a","","24","test1"
"null","r","1","25","test1"
"0","a","","26","test1"
"null","r","1","27","test1"
"0","a","","28","test1"
"null","r","0","29","test1"
"0","a","","30","test1"
"null","r","1","31","test1"
"0","a","","32","test1"
"null","r","1","33","test1"
"0","a","","34","test1"
"null","r","1","35","test1"
"0","a","","36","test1"
"null","r","1","37","test1"
"0","a","","38","test1"
"null","r","1","39","test1"
"0","a","","40","test1"
"null","r","0","41","test1"
"0","a","","42","test1"
"null","r","1","43","test1"
"0","a","","44","test1"
"null","r","0","45","test1"
"0","a","","46","test1"
"null","r","0","47","test1"
"1","a","","48","test1"
"null","r","0","49","test1"
"1","a","","50","test1"
"null","r","1","51","test1"
"1","a","","52","test1"
"null","r","1","53","test1"
"1","a","","54","test1"
"null","r","1","55","test1"
"1","a","","56","test1"
"null","r","1","57","test1"
"1","a","","58","test1"
"null","r","1","59","test1"
"1","a","","60","test1"
"null","r","0","61","test1"
"1","a","","62","test1"
"null","r","0","63","test1"
"1","a","","64","test1"
"null","r","1","65","test1"
"1","a","","66","test1"
"null","r","1","67","test1"
"1","a","","68","test1"
"null","r","1","69","test1"
"1","a","","70","test1"
"null","r","1","71","test1"
"1","a","","72","test1"
"null","r","1","73","test1"
"1","a","","74","test1"
"null","r","0","75","test1"
"1","a","","76","test1"
"null","r","1","77","test1"
"1","a","","78","test1"
"null","r","1","79","test1"
"1","a","","80","test1"
"null","r","1","81","test1"
"1","a","","82","test1"
"null","r","0","83","test1"
"1","a","","84","test1"
"null","r","0","85","test1"
"0","a","","86","test1"
"null","r","1","87","test1"
"0","a","","88","test1"
"null","r","1","89","test1"
"0","a","","90","test1"
"null","r","1","91","test1"
"0","a","","92","test1"
"null","r","1","93","test1"
"0","a","","94","test1"
"null","r","1","95","test1"
"0","a","","96","test1"
"null","r","1","97","test1"
"0","a","","98","test1"
"null","r","0","99","test1"
"0","a","","100","test1"
"null","r","1","101","test1"
"0","a","","102","test1"
"null","r","1","103","test1"
"0","a","","104","test1"
"null","r","0","105","test1"
"0","a","","106","test1"
"null","r","1","107","test1"
"0","a","","108","test1"
"null","r","1","109","test1"
"0","a","","110","test1"
"null","r","1","111","test1"
"0","a","","112","test1"
"null","r","1","113","test1"
"0","a","","114","test1"
"null","r","1","115","test1"
"0","a","","116","test1"
"null","r","1","117","test1"
"0","a","","118","test1"
"null","r","1","119","test1"
"0","a","","120","test1"
"null","r","0","121","test1"
"0","a","","122","test1"
"null","r","0","123","test1"
"1","a","","124","test1"
"null","r","1","125","test1"
"1","a","","126","test1"
"null","r","1","127","test1"
"1","a","","128","test1"
"null","r","0","129","test1"
"1","a","","130","test1"
"null","r","1","131","test1"
"1","a","","132","test1"
"null","r","1","133","test1"
"1","a","","134","test1"
"null","r","1","135","test1"
"1","a","","136","test1"
"null","r","1","137","test1"
"1","a","","138","test1"
"null","r","1","139","test1"
"1","a","","140","test1"
"null","r","0","141","test1"
"1","a","","142","test1"
"null","r","0","143","test1"
"0","a","","144","test1"
"null","r","0","145","test1"
"0","a","","146","test1"
"null","r","0","147","test1"
"1","a","","148","test1"
"null","r","1","149","test1"
"1","a","","150","test1"
"null","r","1","151","test1"
"1","a","","152","test1"
"null","r","1","153","test1"
"1","a","","154","test1"
"null","r","0","155","test1"
"1","a","","156","test1"
"null","r","1","157","test1"
"1","a","","158","test1"
"null","r","1","159","test1"
"1","a","","160","test1"
"null","r","1","161","test1"
"1","a","","162","test1"
"null","r","1","163","test1"
"1","a","","164","test1"
"null","r","0","165","test1"
"1","a","","166","test1"
"null","r","0","167","test1"
"0","a","","168","test1"
"null","r","1","169","test1"
"0","a","","170","test1"
"null","r","1","171","test1"
"0","a","","172","test1"
"null","r","1","173","test1"
"0","a","","174","test1"
"null","r","1","175","test1"
"0","a","","176","test1"
"null","r","1","177","test1"
"0","a","","178","test1"
"null","r","0","179","test1"
"0","a","","180","test1"
"null","r","1","181","test1"
"0","a","","182","test1"
"null","r","1","183","test1"
"0","a","","184","test1"
"null","r","0","185","test1"
"0","a","","186","test1"
"null","r","1","187","test1"
"0","a","","188","test1"
"null","r","1","189","test1"
"0","a","","190","test1"
"null","r","1","191","test1"
"0","a","","192","test1"
"null","r","1","193","test1"
"0","a","","194","test1"
"null","r","1","195","test1"
"0","a","","196","test1"
"null","r","1","197","test1"
"0","a","","198","test1"
"null","r","1","199","test1"
"0","a","","200","test1"
"null","r","0","201","test1"
'

raw_df <- read_csv(I(raw_text))

df_a <- raw_df |>
  filter(variable == "a") |>
  mutate(
    trial = trial_index/2,
    action = as.numeric(as.character(response))
  ) |>
  select(subject_id, trial, action)

df_r <- raw_df |>
  filter(variable == "r") |>
  mutate(
    trial = (trial_index-1)/2,
    reward = as.numeric(as.character(reward))
  ) |>
  select(subject_id, trial, reward)

df <- df_a |>
  left_join(df_r, by = c("subject_id", "trial"))

ggplot(df, aes(x = trial)) +
  geom_line(aes(y = action), color = "black") +
  geom_vline(xintercept = seq(20, 80, by = 20), color = "gray", linetype = "dashed") +
  geom_jitter(aes(y = reward, color = as.factor(reward)), 
              width = 0, height = 0.05, alpha = 0.6, size = 2) +
  scale_color_manual(values = c("0" = "blue", "1" = "red"), name = "reward") +
  scale_y_continuous(breaks = c(0, 1), labels = c("B", "A")) +
  theme_minimal()



# データの準備
stan_data <- list(
  T = nrow(df),
  action = df$action, # 0 or 1
  reward = df$reward  # 0 or 1
)

# コンパイルとサンプリング
mod <- cmdstan_model("q_learning.stan")
fit <- mod$sample(
  data = stan_data,
  seed = 123,
  chains = 4,
  parallel_chains = 4
)

# 推定結果の確認
fit$summary()

# ==============================
# 最初にした時の結果を入れておく
# ==============================

fit_1 <- fit

# ==============================

result <- spread_draws(fit, alpha, beta)
draws |> ggplot(aes(x = alpha)) + stat_halfeye()
result |> ggplot(aes(x = beta)) + stat_halfeye()



draws <- fit$draws(c("alpha", "beta"))

mcmc_scatter(
  draws, 
  pars = c("alpha", "beta"), 
  size = 1, 
  alpha = 0.5
) +
  labs(
    x = expression(alpha),
    y = expression(beta)
  ) +
  theme_minimal()
