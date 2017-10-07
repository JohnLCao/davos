require 'json'

class PriorityQueue
	attr_accessor :data
	@@file_path = './data/data.json'

	def initialize
		file_string = File.read(@@file_path)
		@data = JSON.parse(file_string)
	end

	def insert
	end

	def remove
	end

	def list
	end

	private
		def sort
		end

end