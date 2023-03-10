def get_min(arr)
    min = arr[0]

    for candidate in arr do
        if candidate < min then
            min = candidate
        end
    end

    return min
end


def get_index_of_first_positive(arr)

    for i in (0...arr.size) do
        if arr[i] >= 0
            return i
        end
    end

    return nil
end


def main()
    arr = (File.readlines ARGV[1]).map{ |str| str.to_i }

    case ARGV[0].to_i
    when 1
        puts "Min value: #{get_min(arr)}"
    when 2
        puts "Index of first positive: #{get_index_of_first_positive(arr)}"
    else
        puts "Error"
    end
end

