class Array

  def my_each(&prc)
    self.length.times do |idx|
      prc.call(self[idx])
    end
    self
  end

  def my_select(&prc)
    select_arr = []

    self.my_each do |val|
      select_arr.push(val) if prc.call(val)
    end
    select_arr

  end
  def my_reject(&prc)
    arr = []
    self.my_each do |val|
      arr.push(val) unless prc.call(val)
    end
    arr
  end

  def my_any?(&prc)
    self.my_each do |val|
      return true if prc.call(val)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |val|
      return false if !prc.call(val)
    end
    true
  end

  def my_flatten
    arr = []

    self.my_each do |val|
      if val.is_a?(Array)
        arr += val.my_flatten
      else
        arr.push(val)
      end
    end
    arr
  end

  def my_zip(*args)
    result = []

    self.length.times do |idx|
      self_arr = []

      self_arr.push(self[idx])
      args.each do |arg|
        self_arr.push(arg[idx])
      end
      result.push(self_arr)
    end
    result
  end

  def my_rotate(rotate = 1)
    copy_arr = self.dup
    if rotate == 1
      copy_arr.push(copy_arr.shift())
    elsif rotate < 0
      rotate.abs.times { copy_arr.unshift(copy_arr.pop()) }
    else
      rotate.times { copy_arr.push(copy_arr.shift()) }
    end
    copy_arr
  end

  def my_join(separator = "")
    str = ""
    self.length.times do |idx|
      str += self[idx].to_s
      str += separator if idx < self.length - 1
    end
    str
  end

  def my_reverse
    arr = []

    (self.length - 1).downto(0) { |idx| arr.push(self[idx]) }
    arr

  end

  def bubble_sort!(&prc)
    prc ||= Proc.new { |val1, val2| val1 <=> val2 }

      self.each { (self.length - 1).times do |idx|
          next if prc.call(self[idx], self[idx + 1]) <= 0
          tmp = self[idx]
          self[idx] = self[idx+1]
          self[idx+1] = tmp
      end
      }
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end
end

def substrings(string)
  arr = []

  string.length.times do |idx|
    sub_idx = idx

    while (sub_idx < string.length)
      arr.push(string[idx..sub_idx])
      sub_idx += 1
    end
  end
  arr
end

def subwords(word, dictionary)
  result = []

  substrings(word).each do |substr|
    result.push(substr) if dictionary.include?(substr)
  end
  result
end


def factors(num)
  res = []
  (1..num).each do |n|
    res.push(n) if num % n == 0
  end
  res
end
