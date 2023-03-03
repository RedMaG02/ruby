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