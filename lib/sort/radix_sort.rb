class RadixSort
  def call(arr)
    sorted_array = arr
    digit = 0
    loop do
      sorted_array = bucket_sort(sorted_array, digit)
      digit += 1
    end

  rescue
    sorted_array
  end

  private

  def bucket_sort(sorted_array, digit)
    bucket = make_new_hash
    power = 10 ** digit
    sorted_array.each do |number|
      radix = (number / power) % 10
      bucket[radix] << number
    end

    raise if bucket[0].length == sorted_array.length

    return_array = []
    bucket.each do |_k,v|
      v.each { |number|  return_array << number }
    end

    return_array
  end

  def make_new_hash
    hash = {}
    0.upto(9) {|i| hash[i] = []}
    hash
  end
end
