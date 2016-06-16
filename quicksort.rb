class QuickSort
  def call(arr, from = 0, to = nil)
    to ||= arr.size - 1
    # pivot = partition arr, from, to
    pivot = to
    if from from < to
      call arr, from, pivot-1
      call arr, pivot+1, to
    end
  end

  private

  def partition(arr, lo, hi)
    i,j = lo+1,hi
    while true
      i+=1 while arr[i] <= arr[lo] and i < hi
      j-=1 while arr[j] > arr[lo] and j > lo
      break if i>=j
      arr[i], arr[j] = arr[j], arr[i] #swap
    end
    arr[lo], arr[j] = arr[j], arr[lo]
    j
  end
end
