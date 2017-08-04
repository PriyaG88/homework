class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    if lookup(key)
      puts "Overwriting existing key"
      remove(key)
    end
    @map.push([key, value])
  end

  def lookup(key)
    @map.each do |el|
      return el[1] if el[0] == key
    end
    nil
  end

  def remove(key)
    @map.each do |el|
      @map.delete(el) if el[0] == key
    end
  end
end
