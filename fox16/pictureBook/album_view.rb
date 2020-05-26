require 'album'
require 'photo'
require 'photo_view'

class AlbumView < FXMatrix

	attr_reader :album

	def initialize(p, album)
		super(p , numColumns = 7, :opts => MATRIX_BY_COLUMNS)

		@album = album
		@album.each_photo { |photo| add_photo(photo) }
	end

	def add_photo(photo)
		PhotoView.new(self, photo)
	end

end