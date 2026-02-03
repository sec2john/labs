<p align="center">
  <img src="https://github.com/user-attachments/assets/43130bf7-86a3-4e33-a177-9d3b94ac8a77" width="672" height="384" alt="thumb">
</p>
🛡️ BASH LOTL 01 - Laboratorio de Post-Explotación

📝 Descripción del Escenario
Este laboratorio ha sido diseñado para practicar técnicas de Living off the Land (LotL) en entornos Linux, utilizando exclusivamente Bash para la enumeración y explotación.

El escenario presenta una red segmentada donde el alumno obtiene acceso inicial a una máquina con herramientas muy limitadas (sin nmap, ping, arp ). El objetivo es demostrar cómo un atacante puede "vivir de la tierra", utilizando las capacidades nativas del intérprete de comandos para mapear la red interna y testar la seguridad de un servidor web.

🎯 Objetivos del Laboratorio
Enumeración de Red: Identificar host activos en la subred interna 192.168.56.0/24 mediante scripts de Bash y descriptores de archivos de red (/dev/tcp/).

Fuzzing de Directorios: Crear un enumerador de rutas web artesanal para identificar archivos sensibles y directorios ocultos en el servidor objetivo.

Exfiltracion: Filtraciones de información encontradas en la primera fase.

🚀 Despliegue con Vagrant
Para levantar el laboratorio, asegúrate de tener instalados VirtualBox y Vagrant. Luego, sigue estos pasos:

Clonar/Descargar este repositorio.

Desde una terminal en la carpeta del proyecto, ejecuta:

Bash
vagrant up
Vagrant descargará automáticamente las imágenes necesarias y configurará las redes internas.

Finalizar el Laboratorio: Una vez concluidas las pruebas, puedes eliminar todo el entorno para liberar recursos con el comando:

Bash
vagrant destroy -f
🔌 Información de Conexión
Máquina A (lotl-bash-machine-A-s2j)
SSH: ssh guest@localhost -p 2222

Usuario: guest | Password: 1234abcd

Usuario Root: root | Password: Ks45mm?@plOt6

IP Interna: 192.168.56.10

Máquina B (lotl-bash-machine-B-s2j)
SSH: ssh root@localhost -p 2223 (Acceso directo por puerto mapeado)

Usuario Root: root | Password: Ks45mm?@plOt7

IP Interna: 192.168.56.96

📺 Solución del Laboratorio
Puedes encontrar la resolución completa de este laboratorio, donde explico paso a paso cómo crear los scripts de escaneo y realizar la intrusión usando solo Bash, en el siguiente vídeo de mi canal:

👉 Solo Bash para hackers éticos: usando el sistema contra sí mismo

Laboratorio creado por sec2john para fines educativos.

Solo Bash para hackers éticos: usando el sistema contra sí mismo
sec2john · 898 views


