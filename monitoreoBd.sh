#!/bin/bash/ -e
echo "########################################"
echo  "@dariohmo Enero 27 de 2021 
echo "herramienta monitoreo llamadas Perdidas"


#2021-01-27 07:15:13

#Hoy=`date "+%Y-%m-%d"` # fecha actual
#HoyHora=`date "+%H:%M:%S"`  # hora actual
#UnaHora=`date -d "1 hour ago" "+%Y-%m-%d %H:%M:%S"` #Fecha con una hora antes de la actual del sistema linux o unix.

##Variables de fecha actual y hora; y una hora después
##
FechaHoy=`date "+%Y-%m-%d"`      # variable con la Fecha del sistema cuando se ejecuta.             
HoraActual=`date "+%H:%M:%S"`    # variable con la Hora actual cuando se ejecuta el sistema. 

HoraAntes=`date -d "1 hour ago" "+%H:%M:%S"`  # Esta variable se puede modificar por hora esta 1 Hora, sin son la 10Am - 1 = 09Am
echo
echo $FechaHoy $HoraActual    # Mostrando que la variables funcionenpara colocarlas en el select.
#echo $UnaHora                # Mostrando que efectivamente muestra la hora anterior.  
echo $FechaHoy $HoraAntes

#consula la base de datos con un usuario administrador y realiza el select donde están la variables de Feche con BETWEEN (entre).
#
mysql -u root -pMiUsuario -D asteriskcdrdb -s  -e "SELECT calldate as Fecha, src as Telefono FROM cdr WHERE calldate BETWEEN '$FechaHoy $HoraAntes '  AND '$FechaHoy $HoraActual' AND dst = '192' AND duration <= 30 ORDER BY cdr.calldate DESC;"

# El mysql se puede volver toda la linea una variables y después ser llamada. si quitan la -s no salen un marco o cuadrado delieneado.
# Si requiere pueden crear más variables del archivo mysql.

