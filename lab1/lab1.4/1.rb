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