#include <iostream>
#include <chrono>

int fibonacci(int n) {
    if (n < 0) return -1; // Código de error
    if (n == 0) return 0;
    if (n == 1) return 1;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

int main() {
    int n = 40; // Número a calcular

    auto inicio = std::chrono::high_resolution_clock::now();
    int resultado = fibonacci(n);
    auto fin = std::chrono::high_resolution_clock::now();

    std::chrono::duration<double> tiempo = fin - inicio;
    
    std::cout << "Fibonacci(" << n << ") = " << resultado << std::endl;
    std::cout << "Tiempo de ejecución: " << tiempo.count() << " segundos" << std::endl;

    return 0;
}
