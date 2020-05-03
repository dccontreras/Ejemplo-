dt <- read.csv("AB_NYC_2019.csv")

# Fuente: http://insideairbnb.com/

# Nombre de variables:

## id= Id de la publicacion
## name=  descripcion de la publicacion
## host_id = Id de la persona que publico la oferta
## host_name = Nombre del host
## neighbourhood_group =condados (grupo de barrios)
## neighbourhood =barrio
## latitude = latitud
## longitude = longitud
## room_type = tipo de habitacion
## minimun_nights= minimo de noches de estadia
## number_of_reviews = numero de comentarios sobre el lugar
## last_review = fecha del ultimo comentario
## reviews_per_month = comentarios por mes
## calculated_host_listing_count = cantidad de lugares por host
## availability_365 = numero de dias en los que el lugar esta disponible en el anio


# 1. Muestre el nombre de las columnas
names(dt)
# 2.Muestre las primeras 20 observaciones (utilice el comando head)
head(dt,20)
# 3.Muestre las ultimos 10 hosts
tail(dt[,"host_name"],10)
# 4. Muestre los tipos de las variables. Son correctos?
str(dt)
# 5. Cambie el tipo de variable según corresponda.
dt$name<- as.character(dt$name)
dt$host_name<-as.character(dt$host_name)
dt$neighbourhood<-as.character(dt$neighbourhood)
dt$last_review<-as.Date(dt$last_review)
# 6. Muestre las estadisticas descriptivas.Cuales variables numericas presentan observaciones vacias?
is.na(dt)

sapply(dt[, c("price", "minimun_nights","number_of_reviews","reviews_per_month","availability_365")], summary)
# 7. Utilice na.omit  para eliminar las observaciones con valores perdidos
dt<-na.omit(dt)
# 8. Cual es el condado mas popular en la base de datos?
sort(table(dt$neighbourhood_group),decreasing = TRUE)[1:3]
# 9. A que host corresponde el lugar mas costoso de la base de datos?
dt[which.max(dt$price),c("host_id","host_name")]
# 10. Cuales son las caracteristicas del lugar mas barato?
dt[which.min(dt$price),c("neighbourhood","latitude","longitude","room_type","minimum_nights","availability_365")]
# 11. Construya una nueva variable llamada nueva que identifique con (1) aquellas observaciones
# que se encuentran en el barrio Harlem presentan un numero de reviews mayor a 0,
# tengan cuarto privado y permita quedarte minimo una noche.
nueva<-0
if (dt$neighbourhood=="Harlem" && dt$number_of_reviews>0 && dt$room_type=="Private Room" && dt$minimum_nights>=1){dt$nueva<-1}else dt$nueva<-0 
# 12.Existen valores extremos en el precio (use boxplots).

# 13.Por que el analisis anterior no es correcto? Identifique formas
# en que sea posible hallar valores extremos 

# 14.Existe alguna corelacion entre precio y el numero de reviews por mes?

# 15.cuales variables piensa que puede tener alguna relacion con el precio? 
# indague y compruebe.
