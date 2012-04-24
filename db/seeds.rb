# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create({{ name: 'Chicago' }, { name: 'Copenhagen' }}})
#   Mayor.create(name: 'Emanuel', city: cities.first)

# puts ' *** Empty the MongoDB database ***'
# Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

if Spree::User.first.blank?
  puts ' *** Setting up default user login ***'
  u = Spree::User.create! name: 'Isaac Wooten', username: 'levid', email: 'i.wooten@gmail.com', password: 'wooteni', password_confirmation: 'wooteni', :confirmed_at => DateTime.now
  u.add_role :admin
  u.save!
  puts 'New user created: ' << u.name
end

puts ' *** Setting up Rims ***'
for i in 1..7
   unless defined?(u)
    u = Spree::User.find(1)
   end
     
   ImageUploader.enable_processing = true
   
   @image = ImageUploader.new(u, :image)
   @image.store!(File.open("#{Rails.root}/app/assets/images/img-home-rim-large#{i}.png"))
   
   @medium_image = ImageUploader.new(u, :medium_image)
   @medium_image.store!(File.open("#{Rails.root}/app/assets/images/img-rim-medium#{i}.png"))
   
   @small_image = ImageUploader.new(u, :small_image)
   @small_image.store!(File.open("#{Rails.root}/app/assets/images/img-rim-small#{i}.png"))

   r              = Rim.new
   r.title        = "Rim #{i}"
   r.color        = "Silver"
   r.description  = "This is the description for Rim #{i}"
   r.size         = '24 Inches'
   r.fitting      = '22x10'
   r.image        = @image
   r.medium_image = @medium_image
   r.small_image  = @small_image
   r.save!

   puts 'New Rim created: ' << r.title
end

# puts ' *** Setting up Contents ***'
# 
# Fixtures.create_fixtures("#{Rails.root}/db/fixtures", "contents")
# 
# puts ' *** Setting up Privacy Policy ***'
# 
# Fixtures.create_fixtures("#{Rails.root}/db/fixtures", "privacies")
# 
# puts ' *** Setting up Refund Policy ***'
# 
# Fixtures.create_fixtures("#{Rails.root}/db/fixtures", "refunds")
# 
puts ' *** Setting up Spree Store ***'

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

puts ' *** DB Setup Complete *** '
