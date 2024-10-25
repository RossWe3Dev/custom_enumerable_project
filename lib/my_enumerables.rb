module Enumerable
  def my_select
    arr = []
    self.my_each do |element|
      arr.push(element) if yield(element)
    end

    arr
  end

  def my_all?
    return true if self.empty?
    unless block_given?
      # should also check for argument 'pattern' with no block given

      return true unless self.include?(nil||false)
      false
    else
      self.my_each do |element|
        return false unless yield(element)
      end
      true
    end
  end
end

# define my_each to iterate trough arrays
class Array
  def my_each
    for element in self do
      yield(element)
    end
    return self
  end
end
