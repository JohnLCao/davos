require './priority_queue.rb'
require 'colorize' # make CLI prettier 

pq = PriorityQueue.new

# main loop
begin
	puts "L(ist), I(nsert), R(emove), Q(uit)"
	flag = gets.strip
	case flag.upcase
		when 'L'
			puts 'Current Tasks:'
			unless pq.data.empty?
				pq.data.each do |task|
					task.each do |key,value|
						print "#{key}: #{value}; "
					end
					puts
				end
			else
				puts "You have no tasks! Go outside."
			end
		when 'I'
			
		when 'R'
		when 'Q'
			pq.quit
		else
			puts "Ah...sorry, can't help you with that."
			exit
		end				
end until flag.upcase == 'Q'

puts "Best of luck!"