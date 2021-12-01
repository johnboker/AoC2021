require "optparse"
Dir["Solutions/*.rb"].each { |file| require_relative file }

options = { :day => Time.now.day, :example => false }

OptionParser.new do |opt|
  opt.on("--example") { |o| options[:example] = true }
  opt.on("--day DAY") { |o| options[:day] = o.to_i }
end.parse!

puts options

class_name = "Day%02d" % options[:day]
class_const = Object.const_get(class_name)
day_solution = class_const.new(options[:example])

day_solution.solve
