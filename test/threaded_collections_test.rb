require "test/unit"
require "threaded_collections"

class ThreadedCollectionsTest < Test::Unit::TestCase
  include ThreadedCollections

  class Complex
    attr_reader :id, :name
    attr_writer :id, :name
  end
  
  def setup
    complex      = Complex.new 
    complex.id   = 1
    complex.name = "complex object"
    @collection  = [ 1, 2, 3, "dog", "cat", complex, Time.now, 1.0, 2.0, ["nested", "array"], {"key" => "value"}]
  end
  
  def test_should_process_array
    tps = ThreadedCollectionProcessor.new(@collection)
    tps.process(1) do |thread_id, item| 
      assert_not_nil item 
    end
  end
  
  def test_should_mulithread    
    threads = 3
    threadcounter = []
    tps = ThreadedCollectionProcessor.new(@collection)
    tps.process(threads) do |thread_id, item| 
      threadcounter[thread_id] = item
      sleep 0.1
    end    
    assert threadcounter.length == threads + 1 # I don't use 0 as a thread_id, so need to add one to the count for the length to match
  end
  
  def test_should_build_queue_of_same_size
    len = @collection.length()
    tps = ThreadedCollectionProcessor.new(@collection)
    assert len == tps.queue_length
  end
  
  def test_queue_should_be_empty_after_processing
    tps = ThreadedCollectionProcessor.new(@collection)
    tps.process(1) do |thread_id, item| 
      assert_not_nil item 
    end  
    assert 0 == tps.queue_length
  end
  
end