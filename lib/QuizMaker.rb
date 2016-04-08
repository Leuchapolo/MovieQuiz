require "imdb"

class QuizMaker
	attr_accessor :movies, :correct_answer, :question
	def initialize(term)
		@movies = []
		make_list(term)
		if @movies.length != 0
			make_question
		end
	end
	def make_list(term)
		search = Imdb::Search.new(term)
		if search.movies.size >= 20
			movs = search.movies[0,20]
		else 
			@movies = []
		end
		i = 0
		while @movies.length < 9 && i < 20
			if (movs[i].poster != nil) && (movs[i].release_date != nil) && (movs[i].plot_summary != nil) && (movs[i].cast_characters != nil)
				@movies.push(movs[i])
			end
			i += 1
		end
		if @movies.length < 9 
			@movies = []
		else
			@movies
		end
	end

	def make_question
		spot = Random.rand(@movies.length - 1 )
		ques_choice = Random.rand(3)
		@correct_answer = spot 
		if ques_choice == 0
			date = @movies[spot].release_date
			@question = "was made on " + date 
		elsif ques_choice == 1 
			plot = @movies[spot].plot_summary
			@question = "had a plot that goes as follows: " + plot
		elsif ques_choice == 2 
			chars = @movies[spot].cast_characters
			@question = "had the following characters: " + chars.join(", ")
		end
		

	end

end