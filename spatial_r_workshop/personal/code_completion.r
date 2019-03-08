#mammal range exercise
# get range polygon
species = 'Loxodonta africana'
indeces = which(iucn_mammals$binomial == species)
species_polygons = iucn_mammals[indeces,]

class(species_polygons)

# get raster
setwd('/Users/tobias/GitHub/workshops/ggbc_slw_neic/spatial_r_workshop/')

filename = gsub(" ", "_", species)
file_path = sprintf('./data/present_natural_converted/%s.grd',filename)
species_prenat_raster = raster(file_path)


# transform the data
transformed_species_polygons = st_transform(species_polygons,projection(species_prenat_raster))
transformed_species_range = as(transformed_species_polygons, 'Spatial')
#transformed_combined_species_range = aggregate(transformed_species_range)

#plot 1 
plot(species_prenat_raster,legend=F,axes=F,box=F,main=species)
plot(transformed_species_range,col=alpha('red',0.7),add=T)
plot(transformed_world_spatial,add=T)

# plot 2
plot(transformed_species_range,main=species)
plot(species_prenat_raster,add=T,legend=F,axes=F,box=F)
plot(transformed_species_range,col=alpha('red',0.7),add=T)
plot(transformed_world_spatial,add=T)


#mammal diversity exercise:
country = 'Sweden'
country_index = which(all_countries$SOVEREIGNT == country)
country_sf = all_countries[country_index,1]

country_transformed = st_transform(country_sf,projection(rasters))
country_transformed_spatial = as(country_transformed, 'Spatial')
country_cells = mask(rasters,country_transformed_spatial)

plot(country_transformed_spatial,main=country)
plot(country_cells,add=T)
plot(country_transformed_spatial,add=T)



#intro exercise:
i <- which(lux_spatial$NAME_2 %in% over(spts, lux_spatial)$NAME_2)
g <- lux_spatial[i,]

plot(g, col='blue', lwd=2,axes=T)
points(spts, col='light gray', pch=20)
text(spts, 1:nrow(pts), col='red', cex=1.5,pos=4)

