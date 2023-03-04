def array_max?(arr, candidate_index)
    return arr.max() == arr[candidate_index]
end

def local_min?(arr, candidate_index)

    if candidate_index == 0 and arr[0] < arr[1]
        return true
    elsif candidate_index == arr.size()-1 and arr[candidate_index]< arr[candidate_index - 1]
        return true
    elsif arr[candidate_index]< arr[candidate_index + 1] and arr[candidate_index]< arr[candidate_index - 1]
        return true
    else
        return false
    end

end

#Returns self with first element on the last place
def left_shift!(arr)
    return arr.append(arr.shift())
end

#Returns an array with first element on the last place of given array
def left_shift(arr)
    new_arr = Array.new arr
   
    return left_shift!(new_arr)
end

#Returns an array where first half from elements of even indexes of given array, second half - elements of odd indexes of given array 
def even_odd_array(arr)
    new_arr = Array.new arr
    
    arr.each_index{ |i|
        i % 2 == 0
        new_arr.append(arr[i])
    }

    arr.each_index{ |i|
        i % 2 != 0
        new_arr.append(arr[i])
    }

    return new_arr

end

#Replaces output_list1 with uniq items of list and output_list2 with count of nums from output_list1 in list
def method5(list, output_list1, output_list2)
    output_list1 = Array.new list
    output_list1.uniq!()
    output_list2 = Array.new 

    output_list1.each_index{ |i|
        output_list2.append(list.count{|el| el == output_list1[i]})
    }

    return nil

end

def main()
    puts "Input array:"
    arr = gets.chomp.split(' ').map(&:to_i)

    puts "Choose method:
    1 - array_max?
    2 - local_min?
    3 - left_shift
    4 - even_odd_array
    5 - method5"
    n = gets.chomp.to_i
    case n
    when 1
        puts "Index: "
        ind = gets.chomp.to_i
        puts "Result: #{array_max?(arr, ind)}"
    when 2
        puts "Index: "
        ind = gets.chomp.to_i
        puts "Reult: #{local_min?(arr, ind)}"
    when 3
        puts "Result: #{left_shift(arr)}"
    when 4
        puts "Result: #{even_odd_array(arr)}"
    when 5
        puts "Result: #{method5(arr)}"
    end
end

main
    
