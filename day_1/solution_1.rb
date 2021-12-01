input = File.readlines 'input/input.txt'
cnt = 0
for i in 1..input.length do
    if input[i].to_i > input[i-1].to_i then
        cnt = cnt + 1
    end
end
puts cnt

# alternate version
puts input.map(&:to_i).each_cons(2).count { |a,b| b > a }