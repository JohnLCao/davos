require 'json'
require 'date'

class PriorityQueue
	attr_accessor :data
	@@file_path = './data/data.json'

	def initialize
		file_string = File.read(@@file_path)
		@data = JSON.parse(file_string)
		sort
	end

	def insert task
		@data.push task
		sort
	end

	def next 
		return @data.first
	end

	def remove
		return @data.shift
	end

	def quit
		File.write(@@file_path, JSON.pretty_generate(@data))
	end

	private
		def sort
			@data.sort_by!{ |t| sort_helper(t) }
		end

		# customizable
		def sort_helper task
			# assign weights to input variables
			days_left_weight = 5
			percent_worth_weight = 1
			overdue_str = "OVERDUE "

			# get input variables mupltipled by weights
			days_left = (days_left_weight**-1) * ((Date.parse(task["due-date"]) - Date.today).to_i + 1)
			
			if days_left <= 0
				task["name"].prepend(overdue_str) unless task["name"].start_with?(overdue_str)
			end

			percent_worth = task["percentage"].to_i == 0 ? Float::INFINITY : 
							(percent_worth_weight**-1) * (100 - task["percentage"].to_i)

			# function to get output
			return days_left * percent_worth
		end
end