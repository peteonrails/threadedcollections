require 'rubygems'
require 'rake/testtask'
Gem::manage_gems
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
    s.platform  =   Gem::Platform::RUBY
    s.name      =   "threaded-collections"
    s.version   =   "0.1.0"
    s.author    =   "Peter Jackson"
    s.email     =   "pete @nospam@ peteonrails.com"
    s.summary   =   "A package for manipulating collections over many threads"
    s.files     =   FileList['lib/*.rb', 'test/*'].to_a
    s.require_path  =   "lib"
    s.autorequire   =   "fileutils"
    s.test_files = Dir.glob('tests/*.rb')
    s.has_rdoc  =   true
    s.extra_rdoc_files  =   ["README"]
end

Rake::GemPackageTask.new(spec) do |pkg|
    pkg.need_tar = true
end


task :pkg => "pkg/#{spec.name}-#{spec.version}.gem" do
    puts "generated latest version"
end

task :default => [:test]

desc "Test the Threaded Collection library"
Rake::TestTask.new do |t|
   t.libs << "test"
   t.test_files = FileList['test/*test*.rb']
   t.verbose = true
end  
