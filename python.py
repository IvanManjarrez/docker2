import time

def fibonacci(n):
    if n < 0:
        return -1  # Código de error
    elif n == 0:
        return 0
    elif n == 1:
        return 1
    return fibonacci(n - 1) + fibonacci(n - 2)

n = 40  # Número a calcular

# Medición del tiempo
inicio = time.time()
resultado = fibonacci(n)
fin = time.time()

print(f"Fibonacci({n}) = {resultado}")
print(f"Tiempo de ejecución: {fin - inicio:.6f} segundos")
