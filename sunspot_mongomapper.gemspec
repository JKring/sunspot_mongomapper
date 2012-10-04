# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sunspot_mongomapper"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["sylvainsf"]
  s.date = "2012-10-04"
  s.description = "A Sunspot wrapper for MongoMapper that is like sunspot_rails."
  s.email = "sylvain.niles@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.homepage = "http://github.com/sylvainsf/sunspot_mongomapper"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "A Sunspot wrapper for MongoMapper."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongomapper>, [">= 0"])
      s.add_runtime_dependency(%q<sunspot>, [">= 1.1.0"])
      s.add_runtime_dependency(%q<sunspot_rails>, [">= 1.1.0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rr>, [">= 0"])
    else
      s.add_dependency(%q<mongomapper>, [">= 0"])
      s.add_dependency(%q<sunspot>, [">= 1.1.0"])
      s.add_dependency(%q<sunspot_rails>, [">= 1.1.0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rr>, [">= 0"])
    end
  else
    s.add_dependency(%q<mongomapper>, [">= 0"])
    s.add_dependency(%q<sunspot>, [">= 1.1.0"])
    s.add_dependency(%q<sunspot_rails>, [">= 1.1.0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rr>, [">= 0"])
  end
end

