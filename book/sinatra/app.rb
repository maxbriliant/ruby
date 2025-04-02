require 'sinatra'

class HiSinatra < Sinatra::Base
	get '/' do
		"Hey Sinatra!"
	end
	get '/:age' do
	begin 
		:age

		"Hi, I'm #{params[:age]} years old."
	end
end