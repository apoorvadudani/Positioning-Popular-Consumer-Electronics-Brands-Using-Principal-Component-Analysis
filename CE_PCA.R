brand.ratings <- read.csv("/Users/Archana/Desktop/usfca/github projects/principal component analysis/consumer electronics_brand_ratings_updated.csv")
head(brand.ratings)

summary(brand.ratings)
str(brand.ratings)

x <- 1:1000
x.sc <- (x - mean(x)) / sd(x)
summary(x.sc)

brand.sc <- brand.ratings
brand.sc[, 1:9] <- data.frame(scale(brand.ratings[, 1:9])) 
summary(brand.sc)

install.packages("corrplot")
library(corrplot)
corrplot(cor(brand.sc[, 1:9]), order="hclust")

brand.mean <- aggregate(. ~ brand, data=brand.sc, FUN=mean)
brand.mean

rownames(brand.mean) <- brand.mean[, 1]
brand.mean <- brand.mean[, -1]

install.packages("gplots")
library(gplots)

install.packages("RColorBrewer")
library(RColorBrewer) 

heatmap.2(as.matrix(brand.mean),col=brewer.pal(9, "GnBu"), trace="none", key=FALSE, dend="none", main="\n\n\n\n\nBrand attributes")

set.seed(98286)
xvar <- sample(1:10, 100, replace=TRUE)
yvar <- xvar
yvar[sample(1:length(yvar), 50)] <- sample(1:10, 50, replace=TRUE) 
zvar <- yvar
zvar[sample(1:length(zvar), 50)] <- sample(1:10, 50, replace=TRUE) 
my.vars <- cbind(xvar, yvar, zvar)

plot(jitter(yvar) ~ jitter(xvar))
cor(my.vars)

my.pca <- prcomp(my.vars)
summary(my.pca)

my.pca

cor(my.pca$x)

biplot(my.pca)

brand.pc <- prcomp(brand.sc[, 1:9]) 
summary(brand.pc)

plot(brand.pc, type="l")

biplot(brand.pc)

brand.mean

brand.mu.pc <- prcomp(brand.mean, scale=TRUE) 
summary(brand.mu.pc)

biplot(brand.mu.pc, main="Brand positioning", cex=c(1.5, 1))

brand.mean["Canon", ] - brand.mean["Epson", ]

colMeans(brand.mean[c("Bose", "Canon", "Sony", "LG"), ]) - brand.mean["Epson", ]