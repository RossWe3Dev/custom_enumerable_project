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
      # relevant code for the purpose of the exercise
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
      # relevant code for the purpose of the exercise
      self.my_each do |element|
        return true if yield(element)
      end
      false
    end
  end

  def my_none?
    # should check for no armgument and no block, 'pattern' and no block
    
    # relevant code only for the purpose of the exercise
    self.my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    return self.length unless block_given?
    # should check for 'object' matching
    
    # relevant code for the purpose of the exercise
    count = 0
    self.my_each do |element|
      count +=1 if yield(element)
    end
    count
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
