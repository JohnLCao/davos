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

	def remove
	end

	def quit
	end

	private
		def sort
			@data.sort_by!{ |t| sort_helper(t) }
		end

		# customizable
		def sort_helper task
			# assign weights to input variables
			days_left_weight = 1
			percent_worth_weight = 1

			# get input variables mupltipled by weights
			days_left = days_left_weight * ((Date.parse(task["due-date"]) - Date.today).to_i + 1)
			percent_worth = percent_worth_weight* (100 - task["percentage"].to_i)

			# function to get output
			return days_left * percent_worth
		end
end