module Enumerable
    def my_each
        i = 0
        while i < self.size
            yield(self[i])
            i += 1
        end
        self
    end
    
    def my_each_with_index
        i = 0
        while i < self.size
            yield(self[i], i)
            i += 1
        end
        self
    end

    def my_select
        selected = []
        self.my_each { |i|
            selected.push(i) if yield(i)
        }
        selected
    end

    def my_all?
        self.my_each { |i|
            if yield(i) == false
                return false
            end
        }
        return true
    end

    def my_any?
        self.my_each { |i|
            if yield(i) == true
                return true
            end
        }
        return false
    end

    def my_none?
        self.my_each { |i|
            if yield(i) == true
                return false
            end
        }
        return true
    end

    def my_count
        count = 0
        self.my_each { |i|
            if yield(i) == true
                count += 1
            end
        }
        count
    end

    def my_map
        mapped = []
        self.my_each { |i|
            proc.nil? ? mapped << proc.call(i)  : mapped << yield(i)
        }
        mapped
    end

    def my_inject(start = self[0])
        self.my_each { |i|
            start = yield(start, i)
        }
        start
    end
end

puts [2,4,5].my_inject(0) {|t, i| t + i}

def multiply_els(array)
    array.my_inject(1) {|total, i| total*i}
end
puts multiply_els([2,4,5])

[2,4,5].my_each { |i|
    puts i
}

[2,4,5].my_each_with_index { |i, index|
    puts "#{i} at index #{index}"
}

[2,4,5].my_select { |i|
    if i % 2 == 0
        puts i
    end
}

puts [2,4,5].my_all? { |i| i == 2 }
puts [2,4,5].my_any? { |i| i == 2 }
puts [2,4,5].my_none? { |i| i == 2 }

puts [2,4,5].my_count { |i| i == 2 }

puts [2,4,5].my_map { |i|
    i += 10
}

my_proc = Proc.new {|i| i**2}
puts [2,4,5].my_map(&my_proc)