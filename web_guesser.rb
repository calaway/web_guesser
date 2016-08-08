require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

def check_guess(guess)
  if guess == 0
    ["white", "Try guessing a number:"]
  elsif guess > SECRET_NUMBER + 5
    ["red", "Way too high!"]
  elsif guess > SECRET_NUMBER
    ["pink", "Too high!"]
  elsif guess < SECRET_NUMBER - 5
    ["red", "Way too low!"]
  elsif guess < SECRET_NUMBER
    ["pink", "Too low!"]
  elsif guess == SECRET_NUMBER
    ["green", "You got it right!<br />The secret number is #{SECRET_NUMBER}"]
  else
    ["white", "Try guessing a number:"]
  end
end

get '/' do
  guess = params['guess'].to_i
  background, message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :background => background}
end
