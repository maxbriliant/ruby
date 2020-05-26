#!/bin/ruby
require 'fox16'
include Fox

MAX_WIDTH = 160
MAX_HEIGHT = 108

class PhotoView < FXImageFrame
	def initialize(p, photo)
		super(p, nil)
		load_image(photo.path)
	end

	def load_image(path)
		File.open(path,"rb") do |io|
			self.image = FXJPGImage.new(app, io.read)
			scale_to_small
		end
	end


	def scaled_width(width)
		[width, MAX_WIDTH].min
	end

	def scaled_height(height)
		[height, MAX_HEIGHT].min
	end

	def scale_to_small
		aspect_ratio = image.width.to_f/image.height
		if image.width > image.height
			image.scale(
			  scaled_width(image.width),
			  scaled_width(image.width)/aspect_ratio,
			  1
			)
		else
			image.scale(
				aspect_ratio*scaled_height(image.height),
				scaled_height(image.height),
				1
			)
		end
	end
end

