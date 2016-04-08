class Movie
	attr_accessor :title, :poster, :year
	def initialize(title, poster, year)
		@title = title 
		@poster = poster
		@year = year
	end
end