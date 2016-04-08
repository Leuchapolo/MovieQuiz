require "rspec"
require_relative "../lib/QuizMaker.rb"


describe "QuizMaker" do 
	it "should push @movies 9 movies that all have posters" do 
		quiz = QuizMaker.new("Star Trek")
		expect(quiz.movies.length).to eq(9)
		quiz.movies.each do |mov|
			expect(mov.poster).not_to eq(nil)
		end
	end
	it "should return an empty array if there's less than 9 movies with posters for the term" do 
		quiz = QuizMaker.new("aslfkjasdlfja")
		expect(quiz.movies.length).to eq(0)
	end

end