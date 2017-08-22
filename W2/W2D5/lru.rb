class LRUCache
    def initialize(size)
      @size = size
      @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      # @cache.shift if @cache.length == @size
      if @cache.include?(el)
        @cache.delete(el)
      elsif @cache.length == @size
        @cache.shift
      end
        @cache.push(el)
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache
    end
end
