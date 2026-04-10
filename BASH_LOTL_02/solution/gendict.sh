#!/usr/bin/env bash
# este script crea un diccionario tipo CEWL

#config
BASE_URL="http://192.168.56.200:8080"
URL_FILE="/tmp/urls.txt"
FINAL_DICT="diccionario_acerocorp.txt"

# iteramos entre los paths extraidos con el script previo crawler.sh
while read -r path; do
        echo "[+] Procesando $path ..."
        #extraemos palabras
        # 1. sed 's/>/> /g': Añadimos un espacio después de cada '>' para que al quitar etiquetas las palabras no se peguen.
        # 2. sed 's/<[^>]*>//g': Quitamos las etiquetas HTML.
        # 3. tr ' ' '\n': Convertimos espacios en saltos de línea (mantiene símbolos dentro de palabras).
        curl -s "$BASE_URL$path" | sed 's/>/> /g' | sed 's/<[^>]*>//g' | tr ' ' '\n' >> "$FINAL_DICT"

done< "$URL_FILE"
# LIMPIEZA FINAL (En el directo se hizo a mano en terminal)
# - sed 's/[[:punct:]]$//': Quita puntos o comas al FINAL de una palabra (ej. 'Madrid.' -> 'Madrid')
# - sort -u: Quita duplicados
#sort -u "" | \
#sed 's/[.,;:]$//' | \
#sed '/^$/d' | \
#sed '/^.$/d' > "{$FINAL_DICT}2"
