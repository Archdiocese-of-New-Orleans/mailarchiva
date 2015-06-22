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
  gem.homepage = "http://github.com/billguy/mailarchiva"
  gem.license = "MIT"
  gem.summary = %Q{Access the Mailarchiva API}
  gem.description = %Q{A gem to access the Mailarchiva API}
  gem.email = "dj@dbjohn.com"
  gem.authors = ["David John"]
  # dependencies defined in Gemfile
  gem.add_dependency 'savon', '~> 2.10'
  gem.add_dependency 'mail', '~> 2.6'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

desc "Code coverage detail"
task :simplecov do
  ENV['COVERAGE'] = "true"
  Rake::Task['test'].execute
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mailarchiva #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
