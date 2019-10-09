class Image

  def initialize (array)
      @image = array
  end
  def output_image
      @image.each do |row|
       puts row.join
      end
  end

  def blur_image
    ones = []
    @image.each_index do|x| 
      row = @image[x]      
      row.each_index do |y|
        if @image[x][y] == 1
          ones << [x,y] 
        end
      end
    end

      ones.each do |x,y|
        @image[x][y-1] = 1 if y-1 >= 0 #left
        @image[x-1][y] = 1 if x-1 >= 0 #above
        @image[x+1][y] = 1 if x+1 < @image.length #below
        @image[x][y+1] = 1 if y+1 < @image[0].length #right       
      
      end    
  end

  def blur(distance) 
    distance.times do
      blur_image
    end
  end


end

  image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

#image.blur_image
image.blur(2)
image.output_image



