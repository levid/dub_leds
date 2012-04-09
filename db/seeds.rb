# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts ' *** Empty the MongoDB database ***'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

puts ' *** Setting up default user login and roles ***'

r = Role.create! title: 'admin'
Role.create! title: 'moderator'

u = User.new name:'Isaac Wooten', email:'i.wooten@gmail.com', password:'wooteni', password_confirmation:'wooteni'
u.roles << r
u.save!

puts 'New user created: ' << u.name
puts ' *** Setting up Rims ***'

for i in 1..7
   ImageUploader.enable_processing = true
   @image = ImageUploader.new(u, :image)
   @image.store!(File.open("#{Rails.root}/app/assets/images/img-home-rim-large#{i}.png"))

   @medium_image = ImageUploader.new(u, :medium_image)
   @medium_image.store!(File.open("#{Rails.root}/app/assets/images/img-rim-medium#{i}.png"))

   @small_image = ImageUploader.new(u, :small_image)
   @small_image.store!(File.open("#{Rails.root}/app/assets/images/img-rim-small#{i}.png"))

   r = Rim.new title: "Rim #{i}", color: "Silver", description: "This is the description for Rim #{i}", size: '24 Inches', fitting: '22x10', image: @image, small_image: @small_image
   r.save!

   puts 'New Rim created: ' << r.title
end


Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)
