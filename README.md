#  Nagios Core en Docker (Ubuntu 24.04)

Este repositorio contiene una imagen Docker personalizada que instala y configura **Nagios Core** para ser accesible desde el navegador mediante **Apache2**.

---

##  Requisitos

- Docker y Docker Compose instalados  
- Puerto **80** libre para exponer la interfaz web  
- Acceso a una terminal Linux (idealmente Ubuntu 24.04)  

---

##  Construcción de imagen y ejecución del contenedor

###  Clona este repositorio

```bash
git clone https://github.com/ludobix2/mi_primer_proyecto.git
cd nagios-docker

### Construye la imagen de Docker

```bash
docker build -t nagios-core .


### Ejecuta el Contenedor

```bash
docker run -d -p 8080:80 --name nagios nagios-core

## Acceso al Contenedor

```bash
http://localhost:8080


### Credenciales de Acceso a Nagios
## User: nagiosadmin Pass: nagiosadmin


## Puedes descargar una imagen de nagios subida por mi desde mi repo official Docker Hub

```bash
docker pull ludobix/nagios

### Puedes ejecutar el contenedor

```bash
docker run -d --name nagios -p 8080:80 ludobix/nagios

## Acceso a Nagios


http://localhost:8080

