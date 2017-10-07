require './priority_queue.rb'
require 'colorize' # make CLI prettier eventually

pq = PriorityQueue.new

# main loop
begin
	puts "L(ist), I(nsert), R(emove), Q(uit)"
	flag = gets.strip
end until flag.downcase == 'q'

puts "Best of luck!"