require './priority_queue.rb'

pq = PriorityQueue.new

begin
	puts "Y/N"
	flag = gets.strip
end until flag.downcase == 'n'