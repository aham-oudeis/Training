# def triangles(num)
#   num.times {|idx| puts ('* ' * (idx + 1)).ljust(num)}
# end

# def triangles(num)
#   num.times {|idx| puts (' *' * (idx + 1)).rjust(num * 2)}
# end


# def triangles(num)
#   (0..num).reverse_each {|idx| puts ('* ' * (idx)).rjust(num * 2)}
# end


def triangles(num)
  (0..num).reverse_each {|idx| puts ('* ' * (idx)).ljust(num * 2)}
end

triangles(5)