# Packages
library(meta)
library(dmetar)

# Data
?DepressionMortality
DepressionMortality

# Fixed and random effect model
ma <- metabin(event.e = event.e, 
              n.e = n.e,
              event.c = event.c,
              n.c = n.c, 
              studlab = author,
              data = DepressionMortality,
              method.tau = "PM", 
              comb.fixed = T, 
              comb.random = T,
              prediction = T, 
              hakn = T)
ma

# Forest plot
forest(ma)

# Publication bias
metabias(ma, plotit = T, method.bias = "Egger")
metabias(ma, plotit = T, method.bias = "Begg")
metabias(ma, plotit = T, method.bias = "Deeks")

# Funnel plot
funnel(ma)

# Outlier
find.outliers(ma)

# Influential diagnostic
InfluenceAnalysis(ma)
plot