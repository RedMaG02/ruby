puts "Охаё #{ARGV[0]}. Какой яп по твоей масти?"
language = $stdin.gets.chomp

case language
when "ruby" then puts "подзила"
when "javascript" then puts "лучше бы был ruby"
else puts "скоро будет ruby"
end