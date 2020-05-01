def get_pairs(arr, sum=5)
  arr = arr.clone
  pairs = []

  arr.each_with_index do |first, i|
    break if i == arr.length - 1
    next unless first
    arr[i+1..-1].each_with_index do |second, j|
      next unless second
      if first + second == sum
        pairs << [first, second]
        arr[i+j+1] = nil
        break
      end
    end
  end

  pairs
end
