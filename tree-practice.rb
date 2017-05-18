class TreeNode
  attr_accessor :value, :left, :right

  def initialize(val)
    @value = val
    @left = nil
    @right = nil
  end

  #2. Write a method that returns whether or not a given value exists in the tree.
  def search(value)
    if value == self.value
      return true
    elsif value < self.value
      if self.left == nil
        return false
      else
        return self.left.search(value)
      end
    elsif value > self.value
      if self.right == nil
        return false
      else
        return self.right.search(value)
      end
    end
    return false
  end
end

def is_balanced?(root)
  return true if root == nil
  difference = get_height(root.left) - get_height(root.right)
  if difference.abs > 1
    return false
  else
    return is_balanced?(root.left) && is_balanced?(root.right);
  end
  return false
end

def get_height(node)
  return 0 if node == nil
  left_height = get_height(node.left)
  right_height = get_height(node.right)
  max = left_height > right_height ? left_height : right_height
  return (max + 1)
end

def print_infix(node)
  return if node == nil
  print_infix(node.left)
  print node.value + " "
  print_infix(node.right)
end

def print_operators(node)
  operators = ["+", "-", "*", "/", "%"]
  return if node == nil
  print_operators(node.left)
  if operators.include? node.value
    print node.value + " "
  end
  print_operators(node.right)
end

def leaves_count(node)
  count = 0
  return 0 if node == nil
  if node.left == nil && node.right == nil
    return 1
  else
    return leaves_count(node.left) + leaves_count(node.right)
  end
end

def print_prefix(node)
  return if node == nil
  print node.value + " "
  print_prefix(node.left)
  print_prefix(node.right)
end

def print_postfix(node)
  return if node == nil
  print_postfix(node.left)
  print_postfix(node.right)
  print node.value + " "
end

def exists?(node, operator)
  return false if node == nil
  if node.value.eql? operator
    return true
  else
    exists?(node.right, operator)
    exists?(node.left, operator)
  end
end

#1. Write a method to find the smallest element in a binary search tree.
def find_smalest(node)
  current = node
  while current.left != nil
    current = current.left
  end
  return current.value
end

root = TreeNode.new("+")
root.left = TreeNode.new("3")
root.right = TreeNode.new("2")
print_infix(root)
puts
root = TreeNode.new("-")
root.left = TreeNode.new("+")
root.left.right = TreeNode.new("2")
root.left.left = TreeNode.new("*")
root.left.left.left = TreeNode.new("4")
root.left.left.right = TreeNode.new("3")
root.right = TreeNode.new("%")
root.right.left = TreeNode.new("10")
root.right.right = TreeNode.new("5")
print_infix(root)
puts
puts "Let's write a method that prints out all the operators
that exist in the tree."
print_operators(root)
puts
puts "Write a method that returns the count of
non-operators (in this case, leaves) in the tree."
print leaves_count(root)
puts
puts "Write methods to print the tree in prefix notation."
print_prefix(root)
puts
puts "Write methods to print the tree in postfix notation."
print_postfix(root)
puts
puts "4. Write a method that returns whether or not a given operator
exists in the tree."
root = TreeNode.new("+")
root.left = TreeNode.new("3")
root.right = TreeNode.new("2")
puts exists?(root, "%")
puts exists?(root, "de")
puts exists?(root, "+")
puts

puts "## Binary Search Trees:"
puts " 1, 4, 5, 2, 9 "
root = TreeNode.new("1")
root.right = TreeNode.new("4")
root.right.left = TreeNode.new("2")
root.right.right = TreeNode.new("5")
root.right.right.right = TreeNode.new("9")
print_infix(root)
puts
puts "40, -2, 7, 17, 58, 0"
root = TreeNode.new("40")
root.right = TreeNode.new("58")
root.left = TreeNode.new("-2")
root.left.right = TreeNode.new("7")
root.left.right.left = TreeNode.new("0")
root.left.right.right = TreeNode.new("17")
print_infix(root)
puts
puts " 0, -1, 1"
root = TreeNode.new("0")
root.right = TreeNode.new("1")
root.left = TreeNode.new("-1")
puts

puts "Write a method to find the smallest element in a binary search tree."
puts find_smalest(root)

puts "Write a method that returns whether or not a given value exists in the tree."
puts " 1, 4, 5, 2, 9 "
root = TreeNode.new(1)
root.right = TreeNode.new(4)
root.right.left = TreeNode.new(2)
root.right.right = TreeNode.new(5)
root.right.right.right = TreeNode.new(9)
puts root.search(4)
puts root.search(1)
puts root.search(41)

puts "3. Write a method that determines if a tree is [balanced]or not."
root = TreeNode.new(0)
root.right = TreeNode.new(1)
root.left = TreeNode.new(-1)
puts is_balanced?(root)
