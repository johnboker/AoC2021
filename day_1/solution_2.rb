input = File.readlines 'input/input.txt'
cnt = 0
for i in 0..input.length - 3 do
    window1 = input[i].to_i + input[i + 1].to_i + input[i + 2].to_i
    window2 = input[i + 1].to_i + input[i + 2].to_i + input[i + 3].to_i
    if window1 < window2 then
        cnt = cnt + 1
    end
end
puts cnt

# alternate version
puts input.map(&:to_i).each_cons(3).map(&:sum).each_cons(2).count { |a,b| b > a }
