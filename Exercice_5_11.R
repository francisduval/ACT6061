library(here)

# Importer le jeu de données. On peut utiliser un « path » relatif si on utilise un projet R (fichier .Rproj) ===================
freaggnumber <- read.table(here("data", "freaggnumber.txt"), sep = ";") 


# Ajuster la régression Poiusson et la régression quasi-Poisson =================================================================
fit_poisson <- 
  glm(
    formula = ClaimNumber ~ DriverAge + LicenceAge + VehAge, 
    family = poisson(link = "log"), 
    data = freaggnumber,
    offset = log(Exposure)
  )

fit_quasipoisson <- 
  glm(
    formula = ClaimNumber ~ DriverAge + LicenceAge + VehAge, 
    family = quasipoisson(link = "log"), 
    data = freaggnumber,
    offset = log(Exposure)
  )


# Observer l'ajustement avec summary() et les AIC avec AIC() ====================================================================
summary(fit_poisson)
summary(fit_quasipoisson)

AIC(fit_poisson) # 51758.91
AIC(fit_quasipoisson) # NA
