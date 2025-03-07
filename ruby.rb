def fibonacci(n)
  return -1 if n < 0  # Código de error
  return 0 if n == 0
  return 1 if n == 1
  fibonacci(n - 1) + fibonacci(n - 2)
end

n = 40  # Número a calcular

inicio = Time.now
resultado = fibonacci(n)
fin = Time.now

tiempo = fin - inicio

puts "Fibonacci(#{n}) = #{resultado}"
puts "Tiempo de ejecución: %.6f segundos" % tiempo
