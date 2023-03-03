def get_min(arr)
    min = arr[0]

    for candidate in arr do
        if candidate < min then
            min = candidate
        end
    end

    return min
end