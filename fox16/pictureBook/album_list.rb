class AlbumList

	def initialize
		@albums = []
	end


if __FILE__ == $0 
	FXApp.new do |app| 
		Window.new(app) 
		app.create 
		app.run 
	end 
end
