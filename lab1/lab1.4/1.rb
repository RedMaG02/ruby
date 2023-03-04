def array_max?(arr, candidate_index)
    return arr.max() == arr[candidate_index]

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


def left_shift!(arr)
    return arr.append(arr.shift())
end

def left_shift(arr)
    new_arr = Array.new arr
   
    return left_shift!(new_arr)
end


def nonodd_odd_array(arr)
    new_arr = Array.new arr
    
    arr.each_index.
    {
        |i|
        i % 2 == 0
        new_arr.append(arr[i])
    }

    arr.each_index.
    {
        |i|
        i % 2 != 0
        new_arr.append(arr[i])
    }

    return new_arr

end


def method5(list, output_list1, output_list2)
    output_list1 = Array.new list
    output_list1.uniq!()
    output_list2 = Array.new 

    output_list1.each_index
    {
        |i|
        output_list2.append(list.count{|el| el == output_list1[i]})
    }

    return nil

end
    
