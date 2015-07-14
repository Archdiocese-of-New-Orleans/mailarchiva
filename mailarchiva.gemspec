# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: mailarchiva 0.0.8 ruby lib

Gem::Specification.new do |s|
  s.name = "mailarchiva"
  s.version = "0.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["David John"]
  s.date = "2015-07-14"
  s.description = "A gem to access the Mailarchiva API"
  s.email = "dj@dbjohn.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/mailarchiva.rb",
    "lib/mailarchiva/base.rb",
    "lib/mailarchiva/message.rb",
    "lib/mailarchiva/rest_client.rb",
    "lib/mailarchiva/soap_client.rb",
    "lib/mailarchiva/version.rb",
    "mailarchiva.gemspec",
    "test/helper.rb",
    "test/test_mailarchiva.rb"
  ]
  s.homepage = "http://github.com/Archdiocese-of-New-Orleans/mailarchiva"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "Access the Mailarchiva API"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mail>, ["~> 2.6"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_runtime_dependency(%q<savon>, ["~> 2.10"])
      s.add_runtime_dependency(%q<mail>, ["~> 2.6"])
    else
      s.add_dependency(%q<mail>, ["~> 2.6"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<savon>, ["~> 2.10"])
      s.add_dependency(%q<mail>, ["~> 2.6"])
    end
  else
    s.add_dependency(%q<mail>, ["~> 2.6"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<savon>, ["~> 2.10"])
    s.add_dependency(%q<mail>, ["~> 2.6"])
  end
end

