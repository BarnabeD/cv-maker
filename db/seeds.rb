# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning Positions ..."
Position.destroy_all
puts "=> Done"

puts "Cleaning Companies ..."
Company.destroy_all
puts "=> Done"

puts "Cleaning Clients ..."
Client.destroy_all
puts "=> Done"

puts "Cleaning Graduates ..."
Graduate.destroy_all
puts "=> Done"

puts "Cleaning Training ..."
Training.destroy_all
puts "=> Done"

puts "Cleaning Worker ..."
Worker.destroy_all
puts "=> Done"

puts "Cleaning Sites ..."
Site.destroy_all
puts "=> Done"

puts "Cleaning Users ..."
User.destroy_all
puts "=> Done"




puts "Creating 1 complete set..."
client = Client.create!(name: "Ville de Paris")
puts "creating #{Client.count} client : #{client.name}"
if Rails.env.production?
  puts client
end
if Rails.env.development?
  ap client
end


company = Company.create!(name: "Terideal - DTSS", city: "Wissous")
puts "creating #{Company.count} company : #{company.name}"
if Rails.env.production?
  puts company
end
if Rails.env.development?
  ap company
end

worker = Worker.create!(first_name: "Jean-michel", last_name: "Jarre", birth_date: "1986-03-27", hire_date: "2012-02-21", matricule: 05352)
puts "creating #{Worker.count} worker : #{worker.first_name} #{worker.last_name}"
if Rails.env.production?
  puts worker
end
if Rails.env.development?
  ap worker
end

graduate = Graduate.new(name: "Ingenieur", speciality: "Travaux publics", graduation_date: "2007-12-01", school_name: "Gaudier Brezska", school_department: 45)
graduate.worker = worker
graduate.save!
puts "creating #{Graduate.count} graduate : #{graduate.name}"
if Rails.env.production?
  puts graduate
end
if Rails.env.development?
  ap graduate
end

training_security = Training.new(name: "AIPR", date: "2019-07-14", training_type: "Securité")
training_security.worker = worker
training_security.save!
training_management = Training.new(name: "Management", date: "2014-05-01", training_type: "Professionelle")
training_management.worker = worker
training_management.save!
puts "creating #{Training.count} trainings : #{training_security.name} & #{training_management.name}"
if Rails.env.production?
  puts training_security
  puts training_management
end
if Rails.env.development?
  ap training_security
  ap training_management
end


site = Site.new(name: "Construction des halles de Chatellet", site_type:"Marché unique", start_date: "2000-01-01", end_date: "2008-08-15", amount: 15.4, money_unit: "M€")
site.client = client
# site.save!

position = Position.new(position_name: "Chef de chantier")
position.worker = worker
position.site = site
position.company = company
site.save!
puts "creating #{Site.count} site : #{site.name}"
if Rails.env.production?
  puts site
end
if Rails.env.development?
  ap site
end

position.save!
puts "creating #{Position.count} position : #{position.position_name}"
if Rails.env.production?
  puts position
end
if Rails.env.development?
  ap position
end

puts "Creating users"
admin = User.new(email: "barnabe.dubus@gmail.com", password: "123456", password_confirmation: "123456", admin: true)
admin.skip_confirmation!
admin.save!(validate: false)
user = User.new(email: "nonadmin@gmail.com", password: "123456", password_confirmation: "123456", admin: false)
user.skip_confirmation!
user.save!(validate: false)
puts "creating #{User.count} users : #{user.email}"
if Rails.env.production?
  puts user
end
if Rails.env.development?
  ap user
end

puts "Finished!"
