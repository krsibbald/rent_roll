# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

15.times do
  Resident.find_or_create_by(name: Faker::Name.name )
end

(1..20).each do |n|
  Unit.find_or_create_by(number: n, floor_plan: Unit::VALID_FLOOR_PLANS.sample)
end

# Stays

# past
3.times do
  start_date = rand(20).years.ago.to_date
  Stay.find_or_create_by(
    unit: Unit.all.sample,
    resident: Resident.all.sample,
    move_in: start_date,
    move_out: start_date + rand(10).months
  )
end

# present
3.times do
  Stay.find_or_create_by(
    unit: Unit.all.sample,
    resident: Resident.all.sample,
    move_in: rand(20).months.ago.to_date,
    move_out: Date.today + rand(20).months
  )
end

# present no end date
3.times do
  Stay.find_or_create_by(
    unit: Unit.all.sample,
    resident: Resident.all.sample,
    move_in: rand(20).months.ago.to_date,
    move_out: nil
  )
end

# future
3.times do
  start_date = Date.today + rand(20).years
  Stay.find_or_create_by(
    unit: Unit.all.sample,
    resident: Resident.all.sample,
    move_in: start_date,
    move_out: start_date + rand(20).months
  )
end

# future no end date
3.times do
  start_date = Date.today + rand(20).years
  Stay.find_or_create_by(
    unit: Unit.all.sample,
    resident: Resident.all.sample,
    move_in: start_date,
    move_out: nil
  )
end
