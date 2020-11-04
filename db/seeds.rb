require 'faker'

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


site_positions = [
            'Ouvrier',
            'Ouvrier spécialisé',
            'Opérateur',
            'Assistant chef de chantier',
            'Aide chef de chantier',
            'Chef de chantier',
            'Assistant conducteur de travaux',
            'Aide conducteur de travaux',
            'Conducteur de travaux',
            'Ingénieur travaux',
            'Conducteur de travaux principale',
            'Directeur de travaux',
            'Chef de secteur',
            'Directeur de territoire',
            'Directeur commercial',
            'Directeur'
          ]

puts "Creating complete sets..."

clients = []
30.times do 
  clients << Client.create!(name: "Ville de #{Faker::Address.city}")
  if Rails.env.production? || Rails.env.staging?
    puts Client.last.name
  end
  if Rails.env.development?
    ap Client.last
  end
end
puts ">> #{Client.count} Clients created !"


companies = []
terideal = ['Terideal - DTSS', 'Terideal - DROS', 'Terideal - DREN', 'Terideal - DRST', 'Terideal - DE', 'Terideal - DRCE']
terideal.each do |company|
  companies << Company.create!(name: terideal.sample, city: "Wissous")
  if Rails.env.production? || Rails.env.staging?
    puts companies.last.name
  end
  if Rails.env.development?
    ap companies.last
  end
end
puts ">> #{Company.count} Company created !"

workers = []
100.times do
  workers << Worker.create!(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , birth_date: Faker::Date.birthday(min_age: 16, max_age: 65), hire_date: Faker::Date.between(from: 25.years.ago, to: Date.today), matricule: Faker::Number.unique.number(digits: 5))
  if Rails.env.production? || Rails.env.staging?
    puts "#{workers.last.first_name} #{workers.last.last_name}"
  end
  if Rails.env.development?
    ap workers.last
  end
end
puts ">> #{Worker.count} Workers created !"

graduates = []
200.times do
  graduates << Graduate.new(name: Faker::Job.education_level, speciality: Faker::IndustrySegments.sub_sector, graduation_date: Faker::Date.birthday(min_age: 1, max_age: 40), school_name: Faker::University.name, school_department: Graduate.french_departments.sample)
end

graduates.each do |graduate|
  graduate.worker = workers.sample
  graduate.save!
  if Rails.env.production? || Rails.env.staging?
    puts "#{graduate.name} - #{graduate.speciality}"
  end
  if Rails.env.development?
    ap graduate
  end
end
puts ">> #{Graduate.count} Graduates created!"


trainings = []
training_types = ['Sécurité', 'Professionnelle']
500.times do
  trainings << Training.new(name: Faker::IndustrySegments.sub_sector, date: Faker::Date.birthday(min_age: 16, max_age: 65), training_type: training_types.sample)
end

trainings.each do |training|
  training.worker = workers.sample
  training.save!
  if Rails.env.production? || Rails.env.staging?
    puts "#{training.training_type} : #{training.name}"
  end
  if Rails.env.development?
    ap training
  end
end
puts ">> #{Training.count} Trainings created !"

site_suffixes = ['Aménagement de', 'Renaturation de', 'Restauration de', 'Réhabilitation de', 'Création de', 'Modification de']
site_type = ['Marché unique', 'Marché à bon de commande', 'Accord cadre']
money_unit = ['€', 'K€', 'M€', 'Mrd€']
confidents = ['Confident', 'not sure', 'false']
sites = []
positions = []

800.times do
  sites << Site.new(name: "#{site_suffixes.sample} #{Faker::Lorem.sentence(word_count: 3)} à #{Faker::Address.city}", site_type: site_type.sample, start_date: Faker::Date.between(from: 5.years.ago, to: Date.today), end_date: Faker::Date.between(from: 4.years.ago, to: Date.today), amount: 15.4, money_unit: money_unit.sample, confidence: confidents.sample)
  positions << Position.new(position_name: site_positions.sample)
end

sites.each do |site|
  site.client = clients.sample
end

positions.each do |position|
  position.worker = workers.sample
  position.site = sites.sample
  position.company = companies.sample
end

sites.each do |site|
  site.save!
  puts ">> #{Site.count} Sites created !"
  if Rails.env.production? || Rails.env.staging?
    puts site.name
  end
  if Rails.env.development?
    ap site
  end
end

positions.each do |position|
  position.save!
  puts ">> #{Position.count} Positions created !"
  if Rails.env.production? || Rails.env.staging?
    puts position.position_name
  end
  if Rails.env.development?
    ap position
  end
end

puts "Creating users"
admin = User.new(email: "barnabe.dubus@gmail.com", password: "123456", password_confirmation: "123456", admin: true)
admin.skip_confirmation!
admin.save!(validate: false)
user = User.new(email: "nonadmin@gmail.com", password: "123456", password_confirmation: "123456", admin: false)
user.skip_confirmation!
user.save!(validate: false)
puts "creating #{User.count} users : #{user.email}"
if Rails.env.production? || Rails.env.staging?
  puts admin.email
  puts user.email
end
if Rails.env.development?
  ap admin
  ap user
end

puts "Finished!"
