# PARTE 1
# Creacion de usuarios
sudo useradd usuario1
sudo useradd usuario2
sudo useradd usuario3

# Asignacion de contraseñas
sudo passwd usuarios1
sudo passwd usuarios2
sudo passwd usuarios3

# Información de usuarios
id usuario1

# Eliminación de usuarios
sudo userdel usuario3 --remove

# PARTE2
# Creación de grupos
sudo groupadd grupo1
sudo groupadd grupo2

# Verificar membresia
groups usuario1
groups usuario2

# Eliminar grupo
sudo groupdel grupo2

# PARTE3
# Creación de archivos y directorios
sudo -u usuario1 bash
cd
echo "contenido del archivo1" > archivo1.txt
mkdir directorio1
echo "Contenido del archivo2" > directorio1/archivo2.txt
exit

# Verificar permisos
ls -l archivo1.txt
ls -ld directorio1

# Modificar permisos - Modo numérico
chmod 640 archivo1.txt

# Modificar permisos - Modo Simbólico
chmod u+x directorio1/archivo2.txt

# cambiar el grupo
chgrp grupo1 directorio1/archivo2.txt

# Configurar permisos de directorio
chmod 740 directorio1

# Comprobación de acceso
sudo -u usuario2 bash
cd
cat /home/usuario1/archivo1.txt
cat /home/usuario2/directorio/archivo2.txt
exit

# Verificacion
ls -l archivo1.txt
ls -ld directorio1