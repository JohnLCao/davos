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

	def insert
		
	end

	def remove
	end

	def list
	end

	def quit
	end

	private
		def sort
			@data.sort_by!{ |t| sort_helper(t) }
		end

		# customizable
		def sort_helper task
			return Date.parse(task["due-date"])
		end
end