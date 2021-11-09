class PagesController < ApplicationController
require 'open-uri'

  def new
    @letters = ten_letters
  end

  def score
    if !english_word?(params[:question]) ||
      @result = "you suck bitch"
    else
      if params[:question].length <= 4
        @result = "10"
      elsif params[:question].length == 5
        @result = "50"
      else
        @result = "100"
      end
    end

  end

  private

  def ten_letters
    letters = []
    10.times do
      letters << [*"a".."z"].sample
    end
    return letters
  end

  def english_word?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}").read
    JSON.parse(response)["found"]
  end
end
