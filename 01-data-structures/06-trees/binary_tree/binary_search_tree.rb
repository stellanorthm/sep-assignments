require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      if root.left.nil?
        (root.left = node)
      else insert(root.left, node)
    else
      if root.right.nil?
        (root.right = node)
      else insert(root.right, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
      if root.title == data
        return true
      elsif root.title < data
        if root.left.nil?
          return false
        else
          return root.left.title
      elsif root.right.nil?
          return root.
      end
  end

  def delete(root, data)
    if root.nil?
      return nil
    else
      given_data = find(root, data)
      if given_data.nil?
        given_data.title = nil && target_node.rating = nil
      end
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    children = [@root]
    if root.left.nil?
      root.left.printf("#{root.left.title}: #{root.left.rating}")
    elsif root.right.nil?
      root.right.printf("#{root.left.title}: #{root.left.rating}")
    end
  end

end
