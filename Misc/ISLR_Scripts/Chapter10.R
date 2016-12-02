### Chapter 10 Lab: Principal Components Analysis & Clustering

# 10.1 Principal Components

# Let's look at the USArrests data in the base R pacakge
USArrests
# Rows in this data set are named by states in alphabetical order
states=row.names(USArrests)
states
names(USArrests) # These are the variables collected for each state
apply(USArrests, 2, mean) # Get the mean for each column (using 1 instead of 2 to get means by row)
apply(USArrests, 2, var) # Get the variance for each column
# Note that means and variances differ widely
# This means that we need to scale variables before doing PCA
# Otherwise the Assault variable would dominate the analysis

# The prcomp() function does principal components in the base R package
pr.out=prcomp(USArrests, scale=TRUE) # Notice that we are scaling the variables to have standard deviation of 1
# Note: by default, prcomp() centers variables to have mean of 0

names(pr.out) # Check out the output variables for prcomp()
class(pr.out) # It shows that pr.out is a prcomp() object
summary(pr.out) # Shows various statistics of the principal components
pr.out$sdev # Standard deviations of the principal components
pr.out.eigen = pr.out$sdev^2 # Squaring the standard deviations gives us the variance explained or "eigenvalues"
pr.out.eigen # Display the eigen values
# Note: one important reason to display eigen values is because it is used by the "Kaiser" criteria
#       to decide how many principal componenents are good enoug. The Kaiser criteria is one of the
#       most popular methods for this. Simply, the average eigen values equal 1 (because variables were scaled)
#       The Kaiser criteria says that you should retain all the principal components with eigenvalues > 1
#       (i.e., above average variance). In this example, only PC1 meets this criteria

pr.out$center # Variable means before centering
pr.out$scale # Standard deviation (i.e., square root of variance) before scaling
pr.out$rotation # Shows all the rotated principal components
screeplot(pr.out, main="Scree Plot", xlab="Components") # Display the scree plot
screeplot(pr.out, type="line", main="Scree Plot") # Display the scree plot as a line diagram
biplot(pr.out, scale=0) # Shows the data and the principal components in one diagram
pr.out$x # x is a matrix that contains the calculation of the principal component for each data point

# ASIDE -- Not in the textbook -- Varimax Rotation

# Note: principal components are often further rotated to "tweak" and cleanup the components 
#       a bit more. The rotation makes large factor loadings larger and small factor loadings
#       smaller, such that the most correlated variables are easier to identify because they
#       have larger factor loadings when rotated. The most popular rotation method is the one
#       developed by Kaiser and is called "Varimax". Think of this as further rotating the already
#       rotated principal components just a tad. This is how to rotate the principal components
pr.out.varimax=varimax(pr.out$rotation) 
# Now compare the two sets of principal components and note the the rotated components does
# a better job at grouping variables. This is a most popular application in survey analysis methods
pr.out.varimax # Varimax rotated components
pr.out$rotation # Original principal components

# Interesting fact: you can rotate the principal components 180 degrees and get the same results
dim(pr.out$x)
biplot(pr.out, scale=0)
pr.out$rotation=-pr.out$rotation # Flip the signs
pr.out$x=-pr.out$x
biplot(pr.out, scale=0) # The direction changes, but not the line orientation

# To compute the proportion of variance explained by each principal component, enter:
pve = pr.out.eigen/sum(pr.out.eigen) 
pve # Take a look
# Notice that the first principal component explains 62% of the variance in the data, not bad.

# To plot the proportion of variance explained:
plot(pve, xlab="Principal Component", ylab="Proportion of Variance Explained", ylim=c(0,1),type='b')

# The "cumulative" proportion of variance is useful because it shows how much variance
# is explained by the first x components. This can be obtained with the cumsum() function
cumsum(pve)
# Notice that the first 2 principal components explain 86.7% of the variance
# Now let's plot this
plot(cumsum(pve), xlab="Principal Component", ylab="Cumulative Proportion of Variance Explained", ylim=c(0,1),type='b')
# Notice that the first 2 principal components

# 10.2 K-Means Clustering -- see textbook for explanations

set.seed(2)
x=matrix(rnorm(50*2), ncol=2)
x[1:25,1]=x[1:25,1]+3
x[1:25,2]=x[1:25,2]-4
km.out=kmeans(x,2,nstart=20)
km.out$cluster
plot(x, col=(km.out$cluster+1), main="K-Means Clustering Results with K=2", xlab="", ylab="", pch=20, cex=2)
set.seed(4)
km.out=kmeans(x,3,nstart=20)
km.out
plot(x, col=(km.out$cluster+1), main="K-Means Clustering Results with K=3", xlab="", ylab="", pch=20, cex=2)
set.seed(3)
km.out=kmeans(x,3,nstart=1)
km.out$tot.withinss
km.out=kmeans(x,3,nstart=20)
km.out$tot.withinss

# 10.3 Hierarchical Clustering -- see textbook for explanations

hc.complete=hclust(dist(x), method="complete")
hc.average=hclust(dist(x), method="average")
hc.single=hclust(dist(x), method="single")
par(mfrow=c(1,3))
plot(hc.complete,main="Complete Linkage", xlab="", sub="", cex=.9)
plot(hc.average, main="Average Linkage", xlab="", sub="", cex=.9)
plot(hc.single, main="Single Linkage", xlab="", sub="", cex=.9)
cutree(hc.complete, 2)
cutree(hc.average, 2)
cutree(hc.single, 2)
cutree(hc.single, 4)
xsc=scale(x)
plot(hclust(dist(xsc), method="complete"), main="Hierarchical Clustering with Scaled Features")
x=matrix(rnorm(30*3), ncol=3)
dd=as.dist(1-cor(t(x)))
plot(hclust(dd, method="complete"), main="Complete Linkage with Correlation-Based Distance", xlab="", sub="")


# 10.4 NCI60 Data Example -- see textbook for explanation

# The NCI60 data
library(ISLR)
nci.labs=NCI60$labs
nci.data=NCI60$data
dim(nci.data)
nci.labs[1:4]
table(nci.labs)

# Principal components analysis on the NCI60 Data
pr.out=prcomp(nci.data, scale=TRUE)
Cols=function(vec){
  cols=rainbow(length(unique(vec)))
  return(cols[as.numeric(as.factor(vec))])
}
par(mfrow=c(1,2))
plot(pr.out$x[,1:2], col=Cols(nci.labs), pch=19,xlab="Z1",ylab="Z2")
plot(pr.out$x[,c(1,3)], col=Cols(nci.labs), pch=19,xlab="Z1",ylab="Z3")
summary(pr.out)
plot(pr.out)
pve=100*pr.out$sdev^2/sum(pr.out$sdev^2)
par(mfrow=c(1,2))
plot(pve,  type="o", ylab="PVE", xlab="Principal Component", col="blue")
plot(cumsum(pve), type="o", ylab="Cumulative PVE", xlab="Principal Component", col="brown3")

# Clustering the Observations of the NCI60 Data -- see textbook for explanation
sd.data=scale(nci.data)
par(mfrow=c(1,3))
data.dist=dist(sd.data)
plot(hclust(data.dist), labels=nci.labs, main="Complete Linkage", xlab="", sub="",ylab="")
plot(hclust(data.dist, method="average"), labels=nci.labs, main="Average Linkage", xlab="", sub="",ylab="")
plot(hclust(data.dist, method="single"), labels=nci.labs,  main="Single Linkage", xlab="", sub="",ylab="")
hc.out=hclust(dist(sd.data))
hc.clusters=cutree(hc.out,4)
table(hc.clusters,nci.labs)
par(mfrow=c(1,1))
plot(hc.out, labels=nci.labs)
abline(h=139, col="red")
hc.out
set.seed(2)
km.out=kmeans(sd.data, 4, nstart=20)
km.clusters=km.out$cluster
table(km.clusters,hc.clusters)
hc.out=hclust(dist(pr.out$x[,1:5]))
plot(hc.out, labels=nci.labs, main="Hier. Clust. on First Five Score Vectors")
table(cutree(hc.out,4), nci.labs)