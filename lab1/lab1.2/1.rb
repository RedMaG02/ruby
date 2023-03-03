def prime?(x)
    return (2..x-1).count{|i| x % i == 0} == 0
end

def find_max_prime_divider(x)
    x.downto(1).each { |div| if prime?(div) and x % div == 0 then return div end}
end

puts find_max_prime_divider 15