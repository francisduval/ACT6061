library(here)

freaggnumber <- read.table(here("data", "freaggnumber.txt"), sep = ";") 

fit_poisson <- glm(ClaimNumber ~ DriverAge + LicenceAge + VehAge + Exposure, family = poisson(link = "log"), data = freaggnumber)
fit_quasipoisson <- glm(ClaimNumber ~ DriverAge + LicenceAge + VehAge + Exposure, family = quasipoisson(link = "log"), data = freaggnumber)

summary(fit_poisson)
summary(fit_quasipoisson)

AIC(fit_poisson) # 71790.79
AIC(fit_quasipoisson) # NA
