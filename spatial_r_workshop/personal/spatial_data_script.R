# generate fake data
name <- LETTERS[1:10]
longitude <- c(-116.7, -120.4, -116.7, -113.5, -115.5,
               -120.8, -119.5, -113.7, -113.7, -110.7)
latitude <- c(45.3, 42.6, 38.9, 42.1, 35.7, 38.9,
              36.2, 39, 41.6, 36.9)
sampling_sites <- cbind(longitude, latitude)

# define body sizes of sampled individuals
body_size = c(11,15,17,19,22,12,21,14,9,18)
# plot the data with point size equivalent to values
psize <- 1 + body_size/8
plot(sampling_sites, cex=psize, pch=20, col='red', main='Body size')
# add names to plot
text(sampling_sites, name, pos=4)
legend("topright", legend=sort(body_size), pch=20, pt.cex=sort(psize), col='red', bg='gray')


# make up more data and plot new data as polygon
lon <- c(-116.8, -114.2, -112.9, -111.9, -114.2, -115.4, -117.7)
lat <- c(41.3, 42.9, 42.4, 39.8, 37.6, 38.3, 37.6)
x <- cbind(lon, lat)

# only plot the points of the old data
plot(sampling_sites, main='Body size')
# draw lines between data points
lines(sampling_sites, lwd=3, col='red')
# emphasize the points
points(sampling_sites, cex=psize, pch=20, col='red', main='Body size')

# plot new data as polygon
polygon(x, col='blue', border='light blue')
# emphasize the points
points(x, cex=2, pch=20)





?runif()

library(raster)
library(maptools)
library(maps)
setwd('/Users/tobias/Desktop/r_spatial_data/data/')

island_rasters = list.files('ISLAND_RASTERS/')
species_ranges=list.files('Present_Natural/')

world = raster(paste0("ISLAND_RASTERS/",island_rasters[1]))
for(i in island_rasters) {
  world = world+raster(paste0("ISLAND_RASTERS/",i))
  }

world[world>1] = 1
plot(world)


eurasia1=raster(paste0("ISLAND_RASTERS/RAST_1.tif"))
eurasia2=raster(paste0("ISLAND_RASTERS/RAST_2.tif"))

eurasia = eurasia1 + eurasia2
plot(world)
plot(raster(paste0('Present_Natural/',species_ranges[129])),add=T)


