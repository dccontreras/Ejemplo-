dt <- read.csv("AB_NYC_2019.csv")

# Fuente: http://insideairbnb.com/

# Nombre de variables:


# 1. Muestre el nombre de las columnas
names(dt)
# 2.Muestre las primeras 20 observaciones (utilice el comando head)
head(dt,20)
# 3.Muestre las ultimos 10 hosts
tail(dt[,"host_name"],10)
# 4. Muestre los tipos de las variables. Son correctos?
str(dt)
