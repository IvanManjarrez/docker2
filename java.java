public class java {
    public static int fibonacci(int n) {
        if (n < 0) return -1; // Código de error
        if (n == 0) return 0;
        if (n == 1) return 1;
        return fibonacci(n - 1) + fibonacci(n - 2);
    }

    public static void main(String[] args) {
        int n = 40; // Número a calcular

        long inicio = System.nanoTime();
        int resultado = fibonacci(n);
        long fin = System.nanoTime();

        System.out.println("Fibonacci(" + n + ") = " + resultado);
        System.out.println("Tiempo de ejecución: " + (fin - inicio) / 1e9 + " segundos");
    }
}
