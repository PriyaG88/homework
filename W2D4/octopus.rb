class Array

  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
def sluggish(fishes)
  longest_fish = ""
  i = 0

  while i < fishes.length - 1
    j = i + 1
    while j < fishes.length
      if fishes[i].length >= fishes[j].length
        longest_fish = fishes[i]
      else
        longest_fish = fishes[j]
      end
    end
    i += 1
  end
end

# Find the longest fish in O(n log n) time.
def dominant(fishes)
  prc = Proc.new { |a, b| b.length <=> a.length }
  fishes.merge(&prc).first
end

# Find the longest fish in O(n) time.
def clever(fishes)
  longest_fish = fishes[0]
  i = 1

  while i < fishes.length
    longest_fish == fishes[i] if fishes[i].length > longest_fish.length
    i += 1
  end
  longest_fish
end

# This should take O(n) time.
def slow_dance(target, tiles)
  tiles.each_with_index do |dir, idx|
    return idx if dir == target
  end
end


tiles_hash = {"up": 0, "right-up": 1, "right": 2, "right-down": 3, "down": 4, "left-down": 5, "left": 6, "left-up": 7}
# Use a different data structure and write a new function so that you
# can access the tentacle number in O(1) time.
def fast_dance(target, tiles_hash)
  tiles_hash[target]
end
