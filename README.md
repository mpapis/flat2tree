# Flat2Tree

Transform flat list into (reverse) dependency tree.

## Installation

    gem install Flat2Tree

## Example data

Initialize + enter data for examples:

    require 'flat2tree'
    list = {
      "Tom"=>["Kate", "John"],
      "Kate"=>["John"],
      "John"=>[]
    }.map{|name, list| Flat2Tree::Entry.new(name, list)}

## Example print dependency tree from starting point

`.to_s` produces tree like output compatible with YAML.

    puts Flat2Tree.dependencies_from(list, 'Kate')

    Kate:
        - John

## Example print dependency tree

When no starting node name is given an nameless root container is created, use `.nodes` to get array.

    puts Flat2Tree.dependencies_from(list).nodes

    Tom:
        - Kate:
            - John
        - John
    Kate:
        - John
    John

## Example print simplified reverse dependency tree

It is also to reverse the dependency tree so last leafs end up as roots

    puts Flat2Tree.reverse_dependencies_from(list).simplify.nodes

    John:
        - Tom
        - Kate:
            - Tom

## TODO:

 - handle missing node

## Authors

 - Michal Papis <mpapis@gmail.com>
