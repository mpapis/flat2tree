module Flat2Tree
  # build dependency tree from the list
  def self.dependencies_from(flat_list, name = nil)
    Flat2Tree::Entry.new(name).dependencies(flat_list)
  end

  # build reverse dependency tree from the list
  def self.reverse_dependencies_from(flat_list, name = nil)
    Flat2Tree::Entry.new(name).reverse_dependencies(flat_list)
  end
end

require_relative "flat2tree/entry"
