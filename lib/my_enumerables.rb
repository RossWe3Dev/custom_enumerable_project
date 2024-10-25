module Enumerable
  def my_select
    result = []
    self.my_each do |element|
      result.push(element) if yield(element)
    end
    result
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

      # will work as long as my_all? implements pattern matching
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
    
    # relevant code for the purpose of the exercise
    self.my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    return self.length unless block_given?

    # should also check for 'object' matching
    
    count = 0
    self.my_each do |element|
      count +=1 if yield(element)
    end
    count
  end

  def my_map
    result = []
    self.my_each do |element|
      result.push(yield(element))
    end
    result
  end

  def my_inject(memo = 0)
    self.my_each do |operand|
      memo = yield(memo,operand)
    end
    memo
  end

end

# define #my_each and #my_each_with_index to iterate trough arrays
class Array
  def my_each
    for element in self do
      yield(element)
    end
    self
  end

  def my_each_with_index
    for i in 0...self.length do
      yield(self[i], i)
    end
    self
  end
end
