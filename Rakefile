require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'rubygems'
 
desc 'Default: run unit tests.'
task :default => :test
 
desc 'Test Reggie B.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end
 
desc 'Generate documentation for Reggie B.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'Reggie B.'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

gem_spec = Gem::Specification.new do |s|
  s.name          = "reggieb"
  s.version       = "0.1.0"
  s.author        = "Wyatt Greene"
  s.email         = "techiferous@gmail.com"
  s.summary       = "A Hex/RGB color converter."
  s.description   = %Q{
    Reggie B. converts colors between hex format and rgb format.
    It is very forgiving in the syntax it allows.
  }
  s.require_path  = "lib"
  s.files         = ["lib/reggieb.rb", "LICENSE", "Rakefile", "README",
                     "CHANGELOG",
                     "test/reggieb_test.rb", "test/test_helper.rb"]
  s.homepage      = "http://github.com/techiferous/reggieb"
  s.requirements  << "none"
  s.has_rdoc      = true
  s.test_files    = Dir.glob("test/**/*.rb")
end

Rake::GemPackageTask.new(gem_spec) do |pkg| 
end
