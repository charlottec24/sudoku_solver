class Cell

	attr_accessor :value

	def initialize(input)
		@value = input
	end

	def solved?
		@value != 0
	end

	def update(neighbours)
		possible_values = (1..9).to_a - neighbours.map {|cell| cell.value}
		if possible_values.length == 1
			@value = possible_values.first
		end
	end

end