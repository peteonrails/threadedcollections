require 'thread'

module ThreadedCollections
  # This class will build a threadsafe Queue from a file
  # and process the file on a specified number of threads
  # with a supplied block
  class ThreadedCollectionProcessor
  
    # Take the collection passed in as an argument 
    # and parse it into a threadsafe queue, returning 
    # the number of items safely enqueued
    def initialize(collection)
      @queue = Queue.new()
      collection.each() { |item| @queue.enq(item) }
    end
  
    # The ThreadedCollectionProcessor#process method will spin up threads to process the queue.
    # The queue will be processed until empty, calling out to the associated
    # block to perform the actual work. 
    def process(threadcount, &block)
      threads = []
    
      # Spawn a set of threads to process the queue
      1.upto(threadcount) do |thread_id|
        threads << Thread.new(thread_id) do |i|   # Each thread 
          until @queue.empty?() do                # grabs an item from the queue 
            yield(thread_id, @queue.deq())        # and yields it to the block
          end 
        end  
      end
  
      # Block until all threads are complete
      threads.each() {|thr| thr.join() }
    end

    def queue_length
      return @queue.length
    end
  
  end # class ThreadedCollectionProcessor
end # module