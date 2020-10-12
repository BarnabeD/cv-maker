# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Position.destroy_all
Company.destroy_all
Site.destroy_all
Client.destroy_all
Graduate.destroy_all
Training.destroy_all
Worker.destroy_all


puts "Creating 1 complete set..."
client = Client.create!(name: "Ville de Paris")
puts "creating a client : #{client.name}"
company = Company.new(name: "Terideal - DTSS")
puts "creating a company : #{company.name}"

worker = Worker.create!(first_name: "Jean-michel", last_name: "Jarre", birth_date: "1986-03-27", hire_date: "2012-02-21", matricule: 05352)
puts "creating a worker : #{worker.first_name} #{worker.last_name}"

graduate = Graduate.new(name: "Ingenieur", speciality: "Travaux publics", graduation_date: "2007-12-01", school_name: "Gaudier Brezska", school_department: 45)
graduate.worker = worker
graduate.save
puts "creating a graduate : #{graduate.name}"


training_security = Training.new(name: "AIPR", date: "2019-07-14", training_type: "Securité")
training_security.worker = worker
training_security.save
training_management = Training.new(name: "Management", date: "2014-05-01", training_type: "Professionelle")
training_management.worker = worker
training_management.save
puts "creating 2 trainings : #{training_security.name} & #{training_management.name}"


site = Site.new(name: "Construction des halles de Chatellet", site_type:"unique", start_date: "2000-01-01", end_date: "2008-08-15", amount: 15.4, money_unit: "M€")
site.client = client
site.save
puts "creating a site : #{site.name}"

position = Position.new(position_name: "Chef de chantier")
position.worker = worker
position.site = site
position.company = company
position.save
puts "creating a position : #{position.position_name}"


puts "Finished!"
