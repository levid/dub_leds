require 'mongo'

class GridfsController < ActionController::Metal
  def serve
    gridfs_path = env["PATH_INFO"].gsub("#{Rails.root}/tmp", "")
    begin
      gridfs_file = Mongo::GridFileSystem.new(Mongoid.database).open(gridfs_path, 'r') do |file|
        [200, { 'Content-Type' => file.content_type }, [file.read]]
      end
      # self.response_body = gridfs_file.read
      #      self.content_type = gridfs_file.content_type
    rescue
      # self.status = :file_not_found
      #       self.content_type = 'text/plain'
      #       self.response_body = ''
      
      [404, { 'Content-Type' => 'text/plain' }, ['File not found.']]
    end
  end
end