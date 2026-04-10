# 🛡️ BASH LOTL 02 - Reconocimiento de web server, crawling, diccionario y fuzzing en Bash 

<p align="center">
  <img src="https://github.com/user-attachments/assets/43130bf7-86a3-4e33-a177-9d3b94ac8a77" width="672" height="384" alt="Caratula">
</p>

## Descripción del Escenario
Este laboratorio simula un entorno de red interna diseñado para practicar técnicas de **Living off the Land (LotL)**. El objetivo principal es la enumeración y el abuso de un webserver utilizando exclusivamente herramientas nativas de **Bash**.

El alumno comienza con acceso inicial a la **Máquina A**, un entorno restringido donde no existen herramientas de red comunes (como `nmap`, `arp` o `ping`). Deberá localizar la ip de la máquina B - el objetivo - (Hay varias formas) y una vez localizada, reconocer el servidor web expuesto. Seguidamente serán necesarias técnicas de creación de diccionario, crawling, y enumeración de usuarios para alcanzar 3 flags posibles en la **Máquina B**.

## Objetivos del Laboratorio
* Localización de host objetivo (IP y puerto) - Determinar webserver activo
* Reconocimiento de webserver
* Reconocimiento de usuarios registrados
* Crawling de toda la web.
* Creación de un diccionario tipo CEWL
* Aplicar por Fuerza bruta el diccionario al login (Flag 1)
* Fuzzing con diccionario online https://github.com/danielmiessler/SecLists/blob/master/Discovery/Web-Content/raft-small-words.txt (Flag 2)
* Rehacer script de generación de diccionario (Flag 3)

## Requisitos Previos (Instalación)

Para ejecutar este laboratorio necesitas **VirtualBox** y **Vagrant**. 

### En sistemas basados en Debian (Ubuntu, Kali, Parrot, etc.):
Ejecuta los siguientes comandos para una instalación rápida:

```bash
# Instalar VirtualBox
sudo apt update && sudo apt install -y virtualbox virtualbox-ext-pack

# Instalar Vagrant (Repositorio oficial de HashiCorp)
wget -O- [https://apt.releases.hashicorp.com/gpg](https://apt.releases.hashicorp.com/gpg) | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] [https://apt.releases.hashicorp.com](https://apt.releases.hashicorp.com) $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install vagrant
```

💡 Nota: Si utilizas una distribución distinta (Arch Linux, Fedora, RedHat, etc.), por favor consulta la documentación oficial de cada herramienta para encontrar el comando de instalación adecuado.

##  Despliegue del Laboratorio
Descarga el archivo Vagrantfile de este repositorio y colócalo en una carpeta vacía.

Abre una terminal en esa carpeta y lanza el entorno:

```Bash
vagrant up   #Vagrant descargará las imágenes y configurará automáticamente las interfaces de red.
```
En tu interfaz de virtualbox verás que aparecen dos máquinas nuevas.

Finalizar y Limpiar: Una vez hayas terminado tus pruebas, puedes borrar las máquinas y sus discos para ahorrar espacio con:

```Bash
vagrant destroy -f
```
# Credenciales y Acceso
El acceso se realiza a través de túneles SSH mapeados a puertos locales del anfitrión:

## Máquina A (lotl-bash-machine-A-s2j)
Acceso SSH: 
```bash
ssh guest@localhost -p 2222
```
Usuario Guest: guest | Password: 1234abcd
Usuario Root: root | Password: Ks45mm?@plOt6

Nota: El acceso root to esta habilitado por ssh (no intentes ssh root@localhost -p 2222) 
Lógate primero con el usuario 'guest' por ssh y una vez dentro realiza "su root" + root password

IP Interna: 192.168.56.10

## Máquina B (lotl-bash-machine-B-s2j)
Acceso SSH: 
```bash
ssh root@localhost -p 2223
```
Usuario Root: root | Password: Ks45mm?@plOt7

IP Interna: 192.168.56.200

# ¿Cómo empiezo?
Abre un terminal y conectate a la máquina A con el usuario "guest". 
```bash
ssh guest@localhost -p 2222
```
A partir de ahí debes localizar el servidor B (hay 3 maneras posibles desde la maquina A), una vez localizado, determinar que ip y puerto escuchan como webserver. Después, navegar por el sitio. Localizar puntos de enumeración de usuarios. Localizar los usuarios registrados. Elaborar un crawling del sitio y un diccionario tipo CEWL del webserver. Realizar fuerza bruta sobre el login (flag1), fuzzing (con un script) (flag2) y rehacer el script de diccionario (flag3)

En /home/guest tienes un directorio "solutions" con las soluciones, pero solo puedes acceder con acceso de root. :P

# Solución Paso a Paso
Si te quedas atascado o quieres ver cómo se resuelve este reto utilizando únicamente scripts en Bash, puedes ver mi resolución completa aquí:

[Ver Solución en YouTube: Solo Bash para hackers éticos]()

Me encuentras en la comundad de discord gratuita junto a Lionxsecurity y otras actividades aqui:
https://sec2john.lionxsecurity.es/

Laboratorio creado por sec2john para la comunidad de ciberseguridad.

## Redes Sociales y contacto:

* [ Youtube ](https://www.youtube.com/@sec2john)
* [ TikTok ](https://www.tiktok.com/@sec2john/)
* [ Instagram ](https://www.instagram.com/sec2john/)  
* [ Web ](https://sec2john.com/)
* [ Twitter ](https://x.com/sec2john)
* [ Github ](https://github.com/sec2john)
* [ beacons ](https://beacons.ai/sec2john )
* [ buymeacoffee ](https://buymeacoffee.com/sec2john)

---








