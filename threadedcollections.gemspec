spec = Gem::Specification.new do |s|
    s.platform  =   Gem::Platform::RUBY
    s.name      =   "threaded-collections"
    s.version   =   "0.1.0"
    s.author    =   "Peter Jackson"
    s.email     =   "pete @nospam@ peteonrails.com"
    s.summary   =   "A package for manipulating collections over many threads"
    s.files     =   ['lib/threaded_collections.rb', 'lib/threaded-collections.rb', 'lib/threaded_collections/threaded_collections.rb', 'test/threaded_collections_test.rb', 'LICENSE', 'Rakefile', 'README', 'threadedcollections.gemspec']
    s.require_path  =   "lib"
    s.test_files = ['tests/threaded_collections_test.rb']
    s.has_rdoc  =   true
    s.extra_rdoc_files  =   ["README"]
end  