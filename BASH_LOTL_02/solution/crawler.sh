#!/usr/bin/env bash

# config
BASE_URL="http://192.168.56.200:8080"
QUEUE="/tmp/queue.txt"
URLS="/tmp/urls.txt"

# Limpieza inicial
> "$QUEUE"
> "$URLS"

# Semilla inicial: empezamos por la raíz
echo "/" > "$QUEUE"


function crawl(){
    local current_path=$1

    # 1. Descargamos y extraemos links
    # Filtramos para guarde rutas que empiecen por / (internas) y externas http:/...
    # y evitamos que guarde la propia ruta actual si ya existe
    new_links=$(curl -s "${BASE_URL}${current_path}" | sed 's/></>\n</g' | grep "href='" | grep -oP "href='\K[^']+" )

    #añadimos al fichero de cola
    for link in $new_links; do
        # Solo añadimos a la cola si NO ha sido visitado antes
        if ! grep -qx "$link" "$URLS"; then
            echo "$link" >> "$QUEUE"
            echo "$link" >> "$URLS"
        fi
    done
}

# Bucle de cola dinámica
# Mientras el archivo de cola tenga tamaño mayor a 0
while [ -s "$QUEUE" ]; do
    # 1. Extraemos la primera URL de la lista
    url=$(head -n 1 "$QUEUE")

    echo "Crawling: ${BASE_URL}${url}..."

    # 2. Ejecutamos la lógica de extracción
    crawl "$url"

    # 3. ELIMINAMOS la URL ya procesada de la cola
    # Usamos sed para borrar la primera línea in-place
    sed -i '1d' "$QUEUE"

    # 4. Limpieza opcional: quitar duplicados de la cola que hayan podido entrar
    sort -u "$QUEUE" -o "$QUEUE"

done

echo "URLs descubiertas y visitadas:"
cat "$URLS"
