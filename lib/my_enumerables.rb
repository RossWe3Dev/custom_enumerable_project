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

  def my_any?
    return false if self.empty? && !block_given?
    unless block_given?
      # should also check for argument 'pattern' with no block given

      # will work as long as my_all? implements 'pattern' matching
      return true unless self.my_all?(nil||false)
      false
    else
      self.my_each do |element|
        return true if yield(element)
      end
      false
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
