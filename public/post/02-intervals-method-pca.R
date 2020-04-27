# The intervals method
# Script to get the intervals matrix
# Script powered by Jordi Marce-Nogue and Thomas Puschel
#
# Cite: Marce-Nogue, J., De Esteban-Trivigno, S., Puschel, T.A., Fortuny, J., 2017. The intervals method: a new approach to analyse finite element outputs using multivariate statistics. PeerJ 5, e3793. 
# https://doi.org/10.7717/peerj.3793
# -------------------------------------------------------------------------

devtools::install_github("kassambara/factoextra") 
devtools::install_github("kassambara/ggpubr")

library(FactoMineR)
library(factoextra)

stress.distrib = read.csv("matrix-of-intervals.csv", row.names=1, header = TRUE, sep = ",") 

# 1) Multivariate analysis PCA 

col.number = ncol(stress.distrib)
PCA.stress <- PCA(stress.distrib[,1:col.number],  graph = FALSE)


# 2) Define the parameters and create the biplot

# colors by group
group.colors = row.names(stress.distrib)

#colors by variable
interval.number = nrow(PCA.stress$var$coord)
interval.vector = seq(from = 1, to = interval.number, by=1 )
interval.colors = interval.vector
interval.palette = c("blue","cyan","green","chartreuse","yellow","gold","orange","red")

# Biplot: variables coloured by contribution to PCs

library(ggpubr)

fviz_pca_biplot(PCA.stress, 
                mean.point=F,                     # 
                axes.linetype = "solid",
    
                # Fill individuals by groups
                geom.ind=c("point", "text"),
                pointshape = 21, 
                pointsize = 5,            
                col.ind= "black",                 # 
                fill.ind = group.colors,          # 
                alpha.ind = 1,                    # 
                
                # Color variable by intervals
                geom.var = "arrow",
                col.var = interval.colors,
                arrowsize = 0.5,
                
                repel = TRUE) +                   # Avoid label overplotting
  
  
  #fill_palette(group.palette) +
  gradient_color(interval.palette)+
  labs(x = "PC1", y = "PC2")+
  
  
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
  )







