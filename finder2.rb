class Finder
  def initialize(arr)
    @arr = arr
    @missing = []
  end

  def find_missing
    unless @arr.last == @arr.size
      low = 0
      high = @arr.size - 1
      mid = (low + high) / 2

      parse_array(@arr, low, mid, high)
    end

    if @missing.empty?
      @missing << @arr.size + 1
      @missing << @arr.size + 2
    elsif @missing.size == 1
      @missing << @arr.size + 2
    end

    @missing.sort
  end

  def parse_array(arr, low, mid, high)
    return if @missing.size == 2

    if mid + 2 < arr[mid] && low == high && @missing.empty?
      @missing << mid + 1
      @missing << mid + 2
    elsif mid + 1 < arr[mid] && low == high
      @missing << mid + 1 + @missing.size if arr[mid] != mid + 1 + @missing.size
    elsif mid + 2 < arr[mid]
      # left part
      high = mid
      mid = (low + high) / 2
      parse_array(@arr, low, mid, high)
    elsif mid + 2 == arr[mid]
      # left and right
      parse_array(@arr, low, (low + mid) / 2, mid)
      parse_array(@arr, mid + 1, (mid + 1 + high) / 2, high)
    elsif mid + 2 > arr[mid]
      # right part
      low = mid + 1
      mid = (low + high) / 2
      parse_array(@arr, low, mid, high)
    end
  end
end


arr0 = [*1..33, *35..67, *69..100] # 34, 68
arr1 = [1, 2, 4, 6, 7, 8, 9] # 3, 5
arr2 = [1, 2, 3, 4, 5, 6, 7, 8] # 9, 10
arr3 = [2, 3, 4, 5, 6, 7, 8, 9] # 1, 10
arr4 = [3, 4, 5, 6, 7, 8] # 1, 2
arr5 = [1, 2, 3, 5, 6, 7, 8, 9] # 4, 10
arr6 = [2, 4, 5, 6] # 1, 3
arr7 = [1, 4, 5, 6] # 2, 3
arr8 = [1, 2, 5, 6] # 3, 4
arr9 = [1] # 2, 3
arr10 = [3, 4] # 1, 2
arr11 = [1] # 2, 3
arr12 = [2] # 1, 3
arr13 = [3] # 1, 2
arr14 = [*1..21, *23..32] # 22, 33
arr15 = [*1..21, *23..32, 34] # 22, 33


finder = Finder.new(arr0)
puts "For array '#{arr0}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr1)
puts "For array '#{arr1}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr2)
puts "For array '#{arr2}' missing elemens are #{finder.find_missing}"

finder = Finder.new(arr3)
puts "For array '#{arr3}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr4)
puts "For array '#{arr4}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr5)
puts "For array '#{arr5}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr6)
puts "For array '#{arr6}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr7)
puts "For array '#{arr7}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr8)
puts "For array '#{arr8}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr9)
puts "For array '#{arr9}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr10)
puts "For array '#{arr10}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr11)
puts "For array '#{arr11}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr12)
puts "For array '#{arr12}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr13)
puts "For array '#{arr13}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr14)
puts "For array '#{arr14}' missing elements are #{finder.find_missing}"

finder = Finder.new(arr15)
puts "For array '#{arr15}' missing elements are #{finder.find_missing}"
