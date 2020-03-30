def bubble_sort(list)
    list.size.times { |time|
        index = 0
        while index+1 < list.size do
            if list[index] > list[index+1] 
                list[index], list[index+1] = list[index+1], list[index]
            end
            index += 1
        end
    }

    return list
end

puts bubble_sort([4,3,78,2,0,2]).to_s
puts bubble_sort([9,6,4,3,2,1,0]).to_s

def bubble_sort_by(list)
    list.size.times { |time|
        index = 0
        while index+1 < list.size
            if yield(list[index], list[index+1]) > 0
                list[index], list[index+1] = list[index+1], list[index]
            end
            index += 1
        end
    }
    puts list.to_s
end

bubble_sort_by(["hi","hello","hey"]) do |left, right|
    left.length - right.length
end