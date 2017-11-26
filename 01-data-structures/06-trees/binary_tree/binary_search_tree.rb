require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      root.left.nil? ? (root.left = node) : insert(root.left, node)
    else
      root.right.nil? ? (root.right = node) : insert(root.right, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.nil? || data.nil?
      return nil
    else
      if root.title == data
        return root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    if root.nil? || data.nil?
      return nil
    else
      main = find(root, data)
      main.nil? ? nil : (main.title = nil && main.rating = nil)
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    child = [@root]
    total = []
    while child.length > 0
      root2 = child.shift
      if root2.left != nil
        child.push(root2.left)
      end
      if root2.right != nil
        child.push(root2.right)
      end
      total.push("#{root2.title}: #{root2.rating}")
    end
    total.each {|i| puts i}
  end
end
