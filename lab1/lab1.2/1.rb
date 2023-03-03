def prime?(x)
    return (2..x-1).count{|i| x % i == 0} == 0
end

def get_max_prime_divider(x)
    x.downto(1).each { |div| if prime?(div) and x % div == 0 then return div end}
end


def get_product_of_digits_that_not_divided_by5(x)
    result = 1
    count = 0

    num.digits.each 
    { 
        |digit| 

        if digit % 5 != 0
            result *= digit
            count++ 
        end
    }

    if(count != 0)
        return result
    end

end