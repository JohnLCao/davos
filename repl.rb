require './priority_queue.rb'
require 'colorize' # make CLI prettier 

pq = PriorityQueue.new

# main loop
begin
	puts "L(ist),  I(nsert),  R(emove),  N(ext up),  Q(uit)".colorize(color: :blue, background: :white)
	flag = gets.strip
	case flag.upcase
		when 'L'
			puts 'Current Tasks:'
			unless pq.data.empty?
				pq.data.each do |task|
					task.each do |key,value|
						print "#{key}".cyan + ": #{value}; "
					end
					puts
				end
			else
				puts "You have no tasks! Go outside."
			end
		when 'I'
			# change this later with Task class
			t = {}
			puts "what is the task name? "
			t["name"] = gets.strip
			puts "what is the task percentage?"
			t["percentage"] = gets.strip.to_i
			puts "what is the task due-date? (yyyy-mm-dd)"
			t["due-date"] = gets.strip
			pq.insert t
		when 'R'
			done = pq.remove
			puts "You finished " + "#{done["name"]}".green + ", good job!"
		when 'N'
			puts "You should do " + "#{pq.next["name"]}".green + " next."
		when 'Q'
			pq.quit
		else
			puts "Ah...sorry, can't help you with that."
			pq.quit
			exit
		end				
end until flag.upcase == 'Q'

puts "Best of luck!"