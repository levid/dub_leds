class ToHaml
  def initialize(path)
    @path = path
  end

  def convert!
    Dir["#{@path}/**/*.erb"].each do |file|
      `html2haml -rx #{file} #{file.gsub(/\.erb$/, '.haml')}`
    end
  end
end

path = File.join(File.dirname(__FILE__), 'app', 'views')
ToHaml.new(path).convert!
# 
# class ConvertToHaml
#   def initialize
#     @from_path = File.join(File.dirname(__FILE__), 'app', 'views')
#   end
#   
#   def convert!
#     Dir["#{@from_path}/**/*.erb"].each do |file|
#       puts file
#       # for each .erb file in the path, convert it & output to a .haml file
#       `html2haml -ex #{file} #{file.gsub(/\.erb$/, '.haml')}`
#     end
#   end
# end
# 
# ConvertToHaml.new.convert!