# The intervals method
# Script to carry out the convergence procedure associated with the intervals method
# Script powered by Jordi Marce-Nogue and Thomas Puschel
#
# Cite: Marce-Nogue, J., De Esteban-Trivigno, S., Puschel, T.A., Fortuny, J., 2017. The intervals method: a new approach to analyse finite element outputs using multivariate statistics. PeerJ 5, e3793. 
# https://doi.org/10.7717/peerj.3793
# -------------------------------------------------------------------------

# 1) Read all the files included in the convergence

intervals.data.5 = read.csv("matrix-of-intervals-5.csv", row.names=1, header = TRUE, sep = ",")
intervals.data.10 = read.csv("matrix-of-intervals-10.csv",row.names=1, header = TRUE, sep = ",")
intervals.data.15 = read.csv("matrix-of-intervals-15.csv",row.names=1, header = TRUE, sep = ",")
intervals.data.25 = read.csv("matrix-of-intervals-25.csv", row.names=1,header = TRUE, sep = ",")
intervals.data.50 = read.csv("matrix-of-intervals-50.csv", row.names=1,header = TRUE, sep = ",")
intervals.data.75 = read.csv("matrix-of-intervals-75.csv",row.names=1, header = TRUE, sep = ",")
intervals.data.100 = read.csv("matrix-of-intervals-100.csv", row.names=1,header = TRUE, sep = ",")

#SCALE = T to use the correlation matrix
#SCALE = F to use the variance-covariance matrix

# 2) Compute PCA for each case

PCA.5 = prcomp(intervals.data.5[,1:5], scale=T)
PCA.10 = prcomp(intervals.data.10[,1:10], scale=T)
PCA.15 = prcomp(intervals.data.15[,1:15], scale=T)
PCA.25 = prcomp(intervals.data.25[,1:25], scale=T)
PCA.50 = prcomp(intervals.data.50[,1:50], scale=T)
PCA.75 = prcomp(intervals.data.75[,1:75], scale=T)
PCA.100 = prcomp(intervals.data.100[,1:100], scale=T)

# 3) Calculate te R-squared values for convergence procedure

# PC1 convergence:

Rvalues.pc1 = c(summary(lm(PCA.10$x[,1]~PCA.15$x[,1]))$r.squared,
                summary(lm(PCA.15$x[,1]~PCA.25$x[,1]))$r.squared,
                summary(lm(PCA.25$x[,1]~PCA.50$x[,1]))$r.squared,
                summary(lm(PCA.50$x[,1]~PCA.75$x[,1]))$r.squared,
                summary(lm(PCA.75$x[,1]~PCA.100$x[,1]))$r.squared )

# PC2 convergence:

Rvalues.pc2 = c(summary(lm(PCA.10$x[,2]~PCA.15$x[,2]))$r.squared,
                summary(lm(PCA.15$x[,2]~PCA.25$x[,2]))$r.squared,
                summary(lm(PCA.25$x[,2]~PCA.50$x[,2]))$r.squared,
                summary(lm(PCA.50$x[,2]~PCA.75$x[,2]))$r.squared,
                summary(lm(PCA.75$x[,2]~PCA.100$x[,2]))$r.squared )

# Table with results: R-squared values

data.pca = data.frame(Rvalues.pc1,Rvalues.pc2)
names(data.pca) = c("PC1","PC2")
rownames(data.pca) = c("PCA 10 vs. PCA 15","PCA 15 vs. PCA 25","PCA 25 vs. PCA 50","PCA 50 vs. PCA 75","PCA 75 vs. PCA 100")

rm(intervals.data.5,intervals.data.10,intervals.data.15,intervals.data.25,intervals.data.50,intervals.data.75,intervals.data.100)


# 4) PLot the PCAs and the R-squared values

plot(PCA.5$x[,1], PCA.5$x[,2], pch=19, cex=1.5, xlab = "", ylab ="", asp=T, main = "B) 10 intervals", xlim=rev(range(PCA.5$x[,1])) , ylim = (range(PCA.5$x[,2])))
plot(PCA.10$x[,1], PCA.10$x[,2], pch=19, cex=1.5, xlab = "", ylab ="", asp=T, main = "B) 10 intervals", xlim=rev(range(PCA.10$x[,1])) , ylim = rev(range(PCA.10$x[,2])))
plot(PCA.15$x[,1], PCA.15$x[,2], pch=19, cex=1.5, xlab = "", ylab ="", asp=T, main = "B) 15 intervals", xlim=rev(range(PCA.15$x[,1])) , ylim = rev(range(PCA.15$x[,2])))
plot(PCA.25$x[,1], PCA.25$x[,2], pch=19, cex=1.5, xlab = "", ylab ="", asp=T, main = "C) 25 intervals", xlim=rev(range(PCA.25$x[,1])) , ylim = rev(range(PCA.25$x[,2])))
plot(PCA.50$x[,1], PCA.50$x[,2], pch=19, cex=1.5, xlab = "", ylab ="", asp=T, main = "D) 50 intervals", xlim=rev(range(PCA.50$x[,1])) , ylim = rev(range(PCA.50$x[,2])))
plot(PCA.75$x[,1], PCA.75$x[,2], pch=19, cex=1.5, xlab = "", ylab ="", asp=T, main = "E) 75 intervals", xlim=rev(range(PCA.75$x[,1])) , ylim = rev(range(PCA.75$x[,2])))
plot(PCA.100$x[,1], PCA.100$x[,2], pch=19, cex=1.5, xlab = "", ylab ="", asp=T, main = "E) 100 intervals", xlim=rev(range(PCA.100$x[,1])) , ylim = rev(range(PCA.100$x[,2])))

plot(0,0,main = "F) Convergence", ylim = c(0, 1.2), xlim = c(1, 5))
points(Rvalues.pc1, col = c("tomato"), pch=19, cex=1.5)
points(Rvalues.pc2, col = c("salmon1"), pch=19, cex=1.5)
lines(Rvalues.pc1,lwd=1, col = c("tomato"))
lines(Rvalues.pc2,lwd=1, col = c("salmon1"))
abline(h=1, lty=3)
legend(4.3,0.5, legend= names(data.pca), pch=19,  col=c("salmon1","tomato"),cex=1)

# Clear variables

rm(Rvalues.pc1,Rvalues.pc2)
rm(PCA.5,PCA.10,PCA.15,PCA.25,PCA.50,PCA.75,PCA.100)


