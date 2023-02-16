puts "Введите команду ruby"
ruby_com = $stdin.gets.chomp
puts "Введите команду системы"
sys_com = $stdin.gets.chomp
eval(ruby_com)
puts exec(sys_com)