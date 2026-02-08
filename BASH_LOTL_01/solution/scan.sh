#!/usr/bin/env bash

# funcion invocada cuando no pasan los parametros adecuados
# desde la llamada externa
function usage(){
 echo "Uso: $0 <SUBRED ej: 192.168.90>" >/dev/stderr
 echo " [*] Saliendo..."
 exit 1
}

# Obtenemos parámetro 1 (el único) como unaa SUBRED
# Nos fiamos de la entrada xxx.xxx.xxx (IPv4 de tres bloques)
# Si no, invocamos funcion "usage" y salimos
[[ $# == 1 ]] && SUBNET=$1 || usage;

echo "Subnet is: $SUBNET"

#uso puerto comun, se usa para descubrir hosts en una primera pasada
C_PORT=22
# Puertos interesantes, a usar cuando hay un hit con el puerto común
PORTS=(21 22 23 25 53 80 443 3306 8080)

echo "[*] Escaneando red $SUBNET.0/24 en el puerto $C_PORT"

# Loop principal. Escáner de todos los hosts de una red: 192.168.56.xXx
for i in {1..254}; do
  printf "%s\r" "[-] $SUBNET.$i:$C_PORT"
  # Invocamos procesos hijos en background
  (
    # Establece conexión TCP a la ip de índice $i y puerto C_PORT
    timeout 1 bash -c "echo > /dev/tcp/$SUBNET.$i/$C_PORT" 2>/dev/null
    if [[ $? == 0 ]];
     then
        #Salida anterior exitosa.Tenemos un host que responde en el puerto C_PORT
        echo "[+] Host activo: $SUBNET.$i";
        for port in "${PORTS[@]}";
          do
             #escaneamos el resto de puertos  interesantes
             timeout 1 bash -c "echo > /dev/tcp/$SUBNET.$i/$port" 2>/dev/null && \
             echo "[+]     Puerto abierto: $port"
          done
    fi
  ) &
  #este sleep da un comportamiento más aleatorio al tiempo en el que se
  # hacen las llamadas. En este caso cada llamada se lanza entre 1 y 5 s.
  #sleep $((RANDOM % 5 + 1 ));
done
#El script principal espera a que todos sus hijos terminen antes de  continuar
wait

echo "[*]  Fin del scanner. "
