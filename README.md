# Tree Practice

## Binary Expression Trees
On paper, create a binary expression tree to represent the expressions below.
1. `3 + 2`
2. `3 + 2 - 10`
3. `4 * 3 + 2`
4. `4 * 3 + 2 - 10 % 5`

## Creating a binary manually tree with nodes
1. Take a look at [`tree-practice.rb`](tree-practice.rb)
2. Let's walk through how `3 + 2` was created as a binary tree.
3. Let's walk through how `print_infix` works.
4. Create `4 * 3 + 2 - 10 % 5` in code as a binary tree.

## Pseudocode new tree methods
1. Let's write a method that prints out all the operators that exist in the tree.
Algorithm leaves_count(node)
  if node is empty -> return 0; end
  if node.left and node.right is empty -> return 1
  else return leaves_count(node.left) + leaves_count(node.right)
  end
end
2. Write a method that returns the count of non-operators (in this case, leaves) in the tree.
Algorithm print_operators(node)
  create list of all possible operators
  if node is empty -> return ; end
  call recursively: print_operators(node.left)  
  if list of operators include node.value
    print node.value
  end
  call recursively: print_operators(node.right)  
end

3. Write methods to print the tree in prefix and postfix notations.
Algorithm print_prefix(node)
  if node is empty -> return ; end
  print node.value
  call recursively: print_prefix(node.left)  
  call recursively: print_prefix(node.right)  
end

Algorithm print_postfix(node)
  if node is empty -> return ; end
  call recursively: print_postfix(node.left)  
  call recursively: print_postfix(node.right)
  print node.value  
end


4. Write a method that returns whether or not a given operator exists in the tree.

Algorithm find_if_exists(node, operator)
  if node is nil -> return false ; end
  if node value equal to operator
    return true
  else
  call recursively: find_if_exists(node.left, operator)  
  call recursively: find_if_exists(node.right, operator)  
  end
end

    - _Added fun: If the operator occurs more than once, return the count on how many times it occurs - you may return 0 if it doesn't exist in the tree._

## Code
1. Code out solutions for problems 1-4 above.

## Binary Search Trees
On paper, create a binary search tree (without balancing) adding the following elements in the order provided
1. `1, 4, 5, 2, 9`
1
  \
    4
  /   \
2      5
         \
           9  
2. `40, -2, 7, 17, 58, 0`
      40
    /    \
  -2     58
    \
     7
    /  \
   0   17

3. `0, -1, 1`
   0
 /   \
-1    1
Then create these trees in [`tree-practice.rb`](tree-practice.rb)

## Pseudocode new tree methods
1. Write a method to find the smallest element in a binary search tree.
  Algorithm find_smalest(node)
    set current to node
    while current.left is not nil
      current = current.left
    end
    return current.value
  end


2. Write a method that returns whether or not a given value exists in the tree.
Algorithm search(value)
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


3. Write a method that determines if a tree is [balanced](https://webdocs.cs.ualberta.ca/~holte/T26/balanced-trees.html) or not.
Algorithm is_balanced?(root)
  foreach node in root
    if (get_height(node.left) - get_height(node.right)).abs > 1
      return false
    end  
  end
  return false
end

Algorithm get_height(node)
  if node == nil
    return 0
  end
  return (MAX(get_height.node.left, get_height.node.right) + 1)  
end


## Code
1. Code out solutions for problems 1 and 2 above
    - _Added fun: Code the third problem too!_
