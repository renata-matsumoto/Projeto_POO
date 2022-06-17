require_relative 'url'



puts "\nO que deseja realizar?\n
1: Gerar URL curta \n 
2: Consultar a URL original\n 
3: Sair"
consulta = gets.chomp.to_i

case consulta 

when 1
  puts "Digite a URI que deseja encurtar:"
  url = gets.chomp
  url1 = URL.new(url)
  resultado = url1.longer
  puts "A sua URL encurtada é:#{resultado}."
when 2
  puts "Digite a URL encurtada que deseja descobrir:"
  @short_url = gets.chomp
  url1 = URL.new(@short_url)
  resultado = url1.shorter(@short_url)
  puts "A sua URL original é #{resultado}."
when 3
  puts "Até Logo! "
  exit
else 
  puts "Você digitou uma opção inválida!"
end

