require "sinatra"
require "imdb"
require_relative "lib/QuizMaker.rb"

quiz = nil
score = 0

get "/play" do 
	@quiz = quiz
	@score = score 
	if @quiz != nil
		erb :play
	else
		"You must enter a proper search term first  <a href = "/"> Try Again </a>"
	end

end

post "/play" do 
	@quiz = QuizMaker.new(params[:term])
	@score = score 
	quiz = @quiz
	if @quiz.movies.length == 0 
		@score = score
		@error = 'There are not enough movies for that term.'
		erb :error
	else
		erb :play
	end
end

get "/" do 
	@score = 0
	erb :home
end

post "/" do 
	@score = params[:score].to_i
	score = @score
	erb :home
end





