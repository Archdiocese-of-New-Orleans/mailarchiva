# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "mailarchiva"
  gem.homepage = "http://github.com/Archdiocese-of-New-Orleans/mailarchiva"
  gem.license = "MIT"
  gem.summary = %Q{Access the Mailarchiva API}
  gem.description = %Q{A gem to access the Mailarchiva API}
  gem.email = "dj@dbjohn.com"
  gem.authors = ["David John"]
  # dependencies defined in Gemfile
end

Jeweler::RubygemsDotOrgTasks.new