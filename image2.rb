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
    @ones = []
    @image.each_index do|x| 
      row = @image[x]      
      row.each_index do |y|
        if @image[x][y] == 1
          @ones << [x,y] 
        end
      end
    end

      @ones.each do |x,y|
        @image[x][y-1] = 1 unless y==0 #left
        @image[x-1][y] = 1 unless x==0 #above
        @image[x+1][y] = 1 unless x>=3 #below
        @image[x][y+1] = 1 unless y>=3 #right       
      
      end    
  end
end

  image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.blur_image
image.output_image







