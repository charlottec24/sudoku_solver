class Grid

	attr_accessor :sudoku_string

	def initialize(input)
		@sudoku_string = input.split('')
	end

	def row
		@row = @sudoku_string.map { |x| x.to_i }.each_slice(9).to_a
	end

	def column
		@column = 
	end

	def subgrid

	end
end

c = Grid.new('123364475657656757657650000')
puts c.row.inspect
