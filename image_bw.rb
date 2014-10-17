require "./image_array.rb"
#Request File Name
puts "What is the path of the image you'd like to transform"
file_name = gets.chomp
img = ImageArray.new("./" + file_name)
#Ask Which Transformation is Wanted
puts "Which transformation would you like? Grayscale, Red_Tint, Blue_Tint, Green_Tint, Noise, or Photonegative"
answer = gets.chomp
#Perform Transformation
#Black and White
if answer == "Grayscale"
	img.each do |row|
		row.each do |pixel|
			pixel_grey = (pixel.red + pixel.blue + pixel.green)/3
			pixel.red = pixel_grey
			pixel.blue = pixel_grey
			pixel.green = pixel_grey
		end
	end

#Red Tint
elsif answer == "Red_Tint"
	img.each do |row|
		row.each do |pixel|
			pixel.red = img.max_intensity
		end
	end
#Blue Tint
elsif answer == "Blue_Tint"
        img.each do |row|
                row.each do |pixel|
                        pixel.blue = img.max_intensity
                end
        end
#Green Tint
elsif answer == "Green_Tint"
        img.each do |row|
                row.each do |pixel|
                        pixel.green = img.max_intensity
                end
        end
#Noise
elsif answer == "Noise"
	img.each do |row|
		row.each do |pixel|
			pixel.red = pixel.red**rand(2)
			pixel.green = pixel.green**rand(2)
			pixel.blue = pixel.blue**rand(2)
		end
	end
#Photonegative
elsif answer == "Photonegative"
	img.each do |row|
		row.each do |pixel|
			pixel.red = img.max_intensity - pixel.red
			pixel.blue = img.max_intensity - pixel.blue
			pixel.green = img.max_intensity - pixel.green
		end
	end
end
#Write to New File
img.write("./pandachaged.jpg")
