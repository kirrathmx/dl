#!/bin/bash
pkg install nano -y && apt-get install nano -y
pkg install git -y && apt-get install git -y
pkg install nodejs -y && apt-get install npm
npm i fluent-ffmpeg -g && apt-get install ffmpeg
git clone https://github.com/KillovSky/iris.git && cd iris
npm i
echo -e "------------------------------------"
echo -e "Los archivos han sido instalados"
cho -e " "
echo -e "No olvides editar tu numero de celular en el archivo que se encuentra en la siguiente ruta:"
cho -e " "
echo -e "iris/lib/config/config.json"
cho -e " "
echo -e "teclea: nano /lib/config/config.json"
cho -e " "
echo -e "para editar el archivo donde deberas modificar la linea con tu numero, ejemplo: "owner": "5212961111111@c.us","
cho -e " "
echo -e "Guardas y cierras el archivo editado"
cho -e " "
echo -e "Para iniciar el bot teclea:"
echo -e " "
echo -e "npm start"
echo -e " "
echo -e "Posteriormente escanea el codigo QR para enlaza tu bot"
echo -e " "
echo -e "Instalador Creado por : PowerMX"
echo -e "Bot instalado : Iris"
echo -e "Creditos: KilloSky"
echo -e " "
echo -e " "
echo -e "Bot para Termux"
echo -e "------------------------------------"
