class TreeNode
  attr_accessor :value, :left, :right

  def initialize(val)
    @value = val
    @left = nil
    @right = nil
  end
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
  puts "1. `1, 4, 5, 2, 9`
        2. `40, -2, 7, 17, 58, 0`
        3. `0, -1, 1`"



        
