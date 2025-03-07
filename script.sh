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
    py)   lenguaje="python"   ; imagen="python"  ; comando="python $archivo" ;;
    java) lenguaje="java"      ; imagen="java"    ; comando="javac $archivo && java -cp /codigo ${archivo%.*}" ;;
    cpp)  lenguaje="cpp"      ; imagen="cpp"     ; comando="g++ $archivo -o /codigo/a.out && /codigo/a.out" ;;
    cc)   lenguaje="cpp"      ; imagen="cpp"     ; comando="g++ $archivo -o /codigo/a.out && /codigo/a.out" ;;
    js)   lenguaje="javascript"; imagen="js"     ; comando="node $archivo" ;;
    rb)   lenguaje="ruby"     ; imagen="ruby"    ; comando="ruby $archivo" ;;
    *)    echo "Error: Lenguaje no soportado."; exit 1 ;;
esac

echo "Ejecutando $archivo en un contenedor para $lenguaje..."

inicio=$(date +%s%3N)
salida=$(docker run --rm -v "$(pwd)":/usr/src/app -w /usr/src/app "$imagen" $comando 2>&1)
fin=$(date +%s%3N)
let tiempo=$fin-$inicio
echo "Salida del programa:"
echo "$salida"
echo "Tiempo de ejecución del contenedor: ${tiempo} ms"
