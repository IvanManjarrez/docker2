function fibonacci(n) {
    if (n < 0) {
        return -1; // Código de error
    } else if (n === 0) {
        return 0;
    } else if (n === 1) {
        return 1;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

let n = 40; // Número a calcular

// Medición del tiempo
let inicio = performance.now();
let resultado = fibonacci(n);
let fin = performance.now();

console.log(`Fibonacci(${n}) = ${resultado}`);
console.log(`Tiempo de ejecución: ${(fin - inicio).toFixed(6)} milisegundos`);

