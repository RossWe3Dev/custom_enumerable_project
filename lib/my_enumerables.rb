module Enumerable
  def my_select
    arr = []
    self.my_each do |element|
      arr.push(element) if yield(element)
    end

    arr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for element in self do
      yield(element)
    end
    return self
  end
end
