#!/bin/bash

# Solicitar el archivo de código fuente
echo -n "Ingrese el nombre del archivo a ejecutar: "
read archivo

# Verificar si el archivo existe
if [[ ! -f "$archivo" ]]; then
    echo "Error: El archivo no existe."
    exit 1
fi

# Detectar el lenguaje según la extensión
extension="${archivo##*.}"
case "$extension" in
    py)   lenguaje="python"   ; imagen="python-container"  ; comando="python /codigo/$archivo" ;;
    java) lenguaje="java"      ; imagen="java-container"    ; comando="javac /codigo/$archivo && java -cp /codigo ${archivo%.*}" ;;
    cpp)  lenguaje="cpp"      ; imagen="cpp-container"     ; comando="g++ /codigo/$archivo -o /codigo/a.out && /codigo/a.out" ;;
    cc)   lenguaje="cpp"      ; imagen="cpp-container"     ; comando="g++ /codigo/$archivo -o /codigo/a.out && /codigo/a.out" ;;
    js)   lenguaje="javascript"; imagen="js-container"     ; comando="node /codigo/$archivo" ;;
    rb)   lenguaje="ruby"     ; imagen="ruby-container"    ; comando="ruby /codigo/$archivo" ;;
    *)    echo "Error: Lenguaje no soportado."; exit 1 ;;
esac

echo "Ejecutando $archivo en un contenedor para $lenguaje..."

# Medir el tiempo de ejecución
start=$(date +%s%3N)
docker-compose run --rm "$imagen" bash -c "$comando"
end=$(date +%s%3N)

echo "Tiempo de ejecución: $((end - start)) ms"
