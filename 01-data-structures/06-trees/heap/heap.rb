require_relative 'node'

class Heap
  attr_reader :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating < root.rating
      temp = root
      @root = node
      node = temp
      insert(@root, node)
    else
      if root.left.nil?
        root.left = node
      elsif root.right.nil? && root.left != nil
        root.right = node
      elsif root.left != nil && root.right != nil
        insert(root.left, node)
      end
    end
  end

  def find(root, data)
    if root.nil?
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
    if root.nil?
      return nil
    else
      given_node = find(root, data)
      given_node.nil? ? nil : (given_node.title = nil && given_node.rating = nil)
    end
  end

  def printf
    temp = [@root]
    row = []
    while temp.length > 0
      newRoot = temp.shift
      if newRoot.left != nil
        temp.push(newRoot.left)
      end
      if newRoot.right != nil
        temp.push(newRoot.right)
      end
      temp.push("#{newRoot.title}: #{newRoot.rating}")
    end
    row.each do |x|
      puts x
    end
  end

end
