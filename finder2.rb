class Finder
  attr_reader :iterations

  def initialize(arr)
    @arr = arr
    @missing = []
    @iterations = 0
  end

  def find_missing
    unless @arr.last == @arr.size
      low = 0
      high = @arr.size - 1
      mid = (low + high) / 2
      to_find = 2

      parse_array(low, mid, high, to_find)
    end

    if @missing.empty?
      @missing << @arr.size + 1
      @missing << @arr.size + 2
    elsif @missing.size == 1
      @missing << @arr.size + 2
    end

    @missing
  end

  def parse_array(low, mid, high, to_find)
    @iterations += 1
    return if @missing.size == 2

    if mid + 2 < @arr[mid] && low == high && @missing.empty?
      @missing << mid + 1
      @missing << mid + 2
    elsif mid + 1 < @arr[mid] && low == high
      @missing << mid + 1 + @missing.size if @arr[mid] != mid + 1 + @missing.size
    elsif mid + 2 + @missing.size < @arr[mid]
      # left part
      high = mid
      mid = (low + high) / 2
      parse_array(low, mid, high, to_find)
    elsif mid + 2 + @missing.size == @arr[mid]
      # left and right
      parse_array(low, (low + mid) / 2, mid, 1)
      parse_array(mid + 1, (mid + 1 + high) / 2, high, 1) if to_find == 2
    elsif mid + 2 + @missing.size > @arr[mid]
      # right part
      low = mid + 1
      mid = (low + high) / 2
      parse_array(low, mid, high, to_find)
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
arr16 = [*1..3300, *3302..7255, *7257..10000] # 3301, 7256

[ 
  arr0,
  arr1,
  arr2,
  arr3,
  arr4,
  arr5,
  arr6,
  arr7,
  arr8,
  arr9,
  arr10,
  arr11,
  arr12,
  arr13,
  arr14, 
  arr15,
  arr16
].each do |arr|
  finder = Finder.new(arr)
  puts "For array '#{arr}' missing elements are #{finder.find_missing}"
  puts "#{finder.iterations} iterations"
  puts 
end
