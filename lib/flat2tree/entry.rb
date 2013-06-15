class Flat2Tree::Entry
  attr_accessor :name, :nodes, :meta

  def initialize(name = nil, nodes = nil, meta = nil)
    @name, @nodes, @meta = name, nodes, meta
  end

  # expand flat list into tree
  def dependencies(flat_list)
    @nodes = flat_list.map(&:clone)
    @nodes.each do |entry|
      entry.nodes = entry.nodes.map do |node|
        @nodes.detect{|entry| entry.name == node }
      end
    end
    # extract the start node if name was given
    @nodes = @nodes.detect{|node| node.name == name }.nodes unless name.nil?
    self
  end

  # reverse the dependency tree
  def reverse_dependencies(flat_list)
    if name.nil?
      @nodes = flat_list.map(&:clone) # .select{|entry| entry.nodes.empty? }
    else
      @nodes = flat_list.select{|entry| entry.nodes.include?(name) }.map(&:clone)
    end
    nodes.each{|node| node.reverse_dependencies(flat_list) }
    self
  end

  def simplify
    @nodes.reject! do |search_node|
      @nodes.detect{|iteration_node|
        iteration_node.nodes.detect{|node| node.name == search_node.name }
      }
    end
    self
  end

  # printout the tree
  def to_s(level = 0)
    out = "#{prefix(level)}#{name}"
    out << ":\n" if nodes.size > 0 and name
    out << nodes.map do |n|
      if n.is_a?(Flat2Tree::Entry)
        n.to_s(level + 1)
      else
  n.to_s.split(/\n/).map{|line| "#{prefix(level + 1)}#{line}"}.join("\n")
      end
    end.join("\n") if nodes.size > 0
    out
  end

private
  # calculate spaces prefix for given level
  def prefix(level)
    level == 0 ? "" : "%#{level * 4}s- " % " "
  end
end
