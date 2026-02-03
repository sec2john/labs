# 🛡️ BASH LOTL 01 - Scanner de red y webserver remoto en Bash 

<p align="center">
  <img src="https://github.com/user-attachments/assets/43130bf7-86a3-4e33-a177-9d3b94ac8a77" width="672" height="384" alt="Esquema del Laboratorio">
</p>

## Descripción del Escenario
Este laboratorio simula un entorno de red interna diseñado para practicar técnicas de **Living off the Land (LotL)**. El objetivo principal es la enumeración y el movimiento lateral utilizando exclusivamente herramientas nativas de **Bash**.

El alumno comienza con acceso inicial a la **Máquina A**, un entorno restringido donde no existen herramientas de red comunes (como `nmap`, `arp` o `ping`). Deberá hacer uso de los descriptores de archivos de red de Bash (`/dev/tcp/`) y scripting para mapear el entorno y alcanzar el objetivo final en la **Máquina B**.

## Objetivos del Laboratorio
* Enumeración de Red: Identificar host activos en la subred interna 192.168.56.0/24 mediante scripts de Bash y descriptores de archivos de red (/dev/tcp/).
* Explotación de serviidor web: Crear un enumerador de rutas web artesanal para identificar archivos sensibles y directorios ocultos en el servidor objetivo.
* Exfiltraciones de información encontradas en la primera fase.

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

IP Interna: 192.168.56.96

# ¿Cómo empiezo?
Abre un terminal y conectate a la máquina A con el usuario "guest". 
```bash
ssh guest@localhost -p 2222
```
A partir de ahí debes realizar un script en bash que escanée la red interna 192.168.56.xXx.

En /home/guest tienes un directorio "solutions" con las soluciones, pero solo puedes acceder con acceso de root. :P

# Solución Paso a Paso
Si te quedas atascado o quieres ver cómo se resuelve este reto utilizando únicamente scripts en Bash, puedes ver mi resolución completa aquí:

[Ver Solución en YouTube: Solo Bash para hackers éticos](https://youtu.be/4TZLbhAFbIg)

Me encuentras en la comundad de discord gratuita junto a Lionxsecurity y otras actividades aqui:
https://sec2john.lionxsecurity.es/

Laboratorio creado por sec2john para la comunidad de ciberseguridad.

# Redes Sociales y contacto:

TikTok:   / sec2john   
Twitter: https://x.com/sec2john 
Instagram:   / sec2john  

Web: https://sec2john.com/ 
Github: https://github.com/sec2john 
beacons: https://beacons.ai/sec2john 
buymeacoffee: https://buymeacoffee.com/sec2john

---



