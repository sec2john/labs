#!/usr/bin/env bash

# Este script itera las lineas del fichero wordlist_robots.txt (paths)
# lanzando una request a la ruta formada por el servidor + path
# y captura el código http de salida. Posteriormente comprueba que
# ese codigo es uno interesante 200|301|302|401|403|500 y lo escribe
# por salida estándar
while read -r path; do
  # Usamos sustitución de comandos $(...) para obtener la salida
  # de curl y guardar el código en la variable code.
  code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 2 \
         http://192.168.56.96/$path)
  # Si el código es uno interesante (de la lista - es una regex)
  if [[ "$code" =~ ^(200|301|302|401|403|500)$ ]];
   then
     echo " [*] $path -> $code"
   fi
 printf "%s %s\r" "$path" "$code"
done < wordlist_robots.txt
