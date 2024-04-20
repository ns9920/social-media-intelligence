library("igraph")

# set the working directory to the location of the data
setwd("~/Projects/teaching/301116-social_media_intelligence/labs/")
# load the data
g = read.graph(file="telephoneCalls.net", format="pajek")


### Part 1
## Computing the neighbourhood overlap of each edge

## get the neighbourhood graph of all nodes.
gn = neighborhood(g, order = 1)

## get pair of nodes that are at the end of each edge.
g.ends = ends(g, E(g))

# number of edges
N = nrow(g.ends)
# make space for neighbourhood overlap score
NO = rep(0, N)

for (a in 1:N) {
  ## for every edge

  x = g.ends[a,1] # x is the node at one end of the edge
  y = g.ends[a,2] # y is the node at the other end of the edge

  ## compute the intersection of the neighbourhoods of x and y
  i = length(intersect(gn[[x]], gn[[y]])) - 2
  ## compute the union of the neighbourhoods of x and y
  u = length(union(gn[[x]], gn[[y]])) - 2

  ## Note that we subtract 2 since each neighbourhood includes x and y.
  ## we don't want to include x and y in the counts.

  ## the neighbourhood overlap is the intersection/union
  NO[a] = i/u
}

## plot edge weight vs. neighbourhood overlap.
plot(E(g)$weight, NO)
## This plot should look similar to the plot from the lecture.

### Part 2
## Partitioning the graph using betweenness.

## compute the betweenness of every edge
geb = edge_betweenness(g)
## compare the betweenness to the edge weight
plot(E(g)$weight, geb)

## compare the betweenness to the neighbourhood overlap.
## use a log-log scale
plot(NO, geb, log="xy")
## Note that there seems to be a linear decrease on the log-log scale.

# split the graph into components
gd = decompose(g)

# examine the number of nodes in each component
sapply(gd, function(x) { length(V(x)) })

# perform the partitioning on the first (largest) component.
## Note: this might take a few minutes to run.
## There might also be warnings about scores.
gPart = cluster_edge_betweenness(gd[[1]], directed=FALSE)


## choose a partition and visualise its graph
partitionNo = 1
vPos = which(gPart$membership == partitionNo)
## extract the subgraph containing only nodes from chosen partition.
gds = subgraph(gd[[1]], vPos)
plot(gds, vertex.size = 5)


## Examine the dendrogram of the partitioning
plot(as.dendrogram(gPart))
