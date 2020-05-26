#!/bin/ruby
require 'fox16'
include Fox

# add current directory to path of libs
$: << "."
#### to find 'photo'

require 'album'
require 'photo'
require 'album_view'


class PictureBook < FXMainWindow

	def initialize(app)
		super(app, "Image Galery")#, :width => 160*7, :height => 108*7)
		#photo = Photo.new("ruby.png")

		@album = Album.new("Wallpaper Folder")

		def add_menu_bar
			menu_bar = FXMenuBar.new(self, LAYOUT_SIDE_TOP|LAYOUT_FILL_X)
			file_menu = FXMenuPane.new(self)
			FXMenuTitle.new(menu_bar, "File", :popupMenu => file_menu)
		
			import_cmd = FXMenuCommand.new(file_menu, "Import...")
			import_cmd.connect(SEL_COMMAND) do |
				##|
			end
			dialog = FXFileDialog.new(self, "Import Photos")
			dialog.selectMode = SELECTFILE_MULTIPLE
			dialog.patternList = ["JPG IMAGES (*.jpg, *.jpeg)"]
			if dialog.execute != 0
				import_photos(dialog.filenames)
			end

		end

		def import_photos(filenames)
			filenames.each do |filename|
				photo = Photo.new(filename)
				@album.add_photo(photo)
				@album_view.add_photo(photo)
			end
			@album_view.create
		end



		$count = 0
		Dir.glob("/home/jack/Pictures/wallpaper/*.jpg") do |img_file|
			if $count <= 48
				img_file = img_file
				@album.add_photo(Photo.new(img_file))
				puts img_file
				$count += 1
			end
		end
	
		@album_view = AlbumView.new(self, @album)

	end

	def create
		super
		show(PLACEMENT_SCREEN)

	end


end

if __FILE__ == $0
	FXApp.new do |app|
		PictureBook.new(app)
		app.create
		app.run
	end
end