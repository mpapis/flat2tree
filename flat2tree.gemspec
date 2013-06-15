#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

Kernel.load File.expand_path("../lib/flat2tree/version.rb", __FILE__)

Gem::Specification.new do |s|
  s.name        = "flat2tree"
  s.version     = Flat2Tree::VERSION
  s.authors     = ["Michal Papis"]
  s.email       = ["mpapis@gmail.com"]
  s.homepage    = "https://github.com/mpapis/flat2tree"
  s.summary     = %q{Transform flat list into (reverse) dependency tree}

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")

  #s.add_development_dependency "smf-gem"
end
