# 🐧 Nagios Core en Docker (Ubuntu 24.04)

Este repositorio contiene una imagen Docker personalizada que instala y configura **Nagios Core** para ser accesible desde el navegador mediante **Apache2**.

---

##  📋 Requisitos

- Docker y Docker Compose instalados  
- Puerto **80** libre para exponer la interfaz web  
- Acceso a una terminal Linux (idealmente Ubuntu 24.04)  

---

##  🛠️ Construcción de imagen y ejecución del contenedor

##  Clona este repositorio:

```sh
git clone https://github.com/ludobix2/mi_primer_proyecto.git
cd mi_primer_proyecto
```

## Construye la imagen de Docker:

```sh
docker build -t nagios-core .
```


## Ejecuta el Contenedor:

```sh
docker run -d -p 8080:80 --name nagios nagios-core
```

## Acceso al Contenedor:

```sh
http://localhost:8080
```


## 🔐 Credenciales de acceso a Nagios

Usuario: nagiosadmin
Contraseña: nagiosadmin


## 📦 Imagen preconstruida (Docker Hub)

```sh
docker pull ludobix/nagios
```

### Puedes ejecutar directamente:

```sh
docker run -d --name nagios -p 8080:80 ludobix/nagios
```

## Acceso a Nagios:

```sh
http://localhost:8080
```

🧑‍💻 Autor

GitHub: @ludobix2
Docker Hub: ludobix

