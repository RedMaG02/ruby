def prime?(x)
    return (2..x-1).count{|i| x % i == 0} == 0
end

def get_max_prime_divider(x)
    x.downto(1).each { |div| if prime?(div) and x % div == 0 then return div end}
end


def get_product_of_digits_that_not_divided_by5(x)
    result = 1
    count = 0

    x.digits.each 
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


def get_max_odd_nonprime_divider(x)

    (x/2).downto(9).each
    {
        |candidate|
        if !prime?(candidate) and candidate % 2 != 0 and x % candidate == 0
            return candidate
        end
    }

    return nil

end

def get_product_of_digits(x)

    result = 1

    x.digits.each
    {
        [gigit]
        result *= gidit
    }

    return result

end

def method3(x)
    return get_max_odd_nonprime_divider(x).gcd(get_product_of_digits(x))
end