namespace :reports do
  desc "Takes date as param, returns list of units with current and future residents"
  task :rent_roll=> :environment do
    given_date = Date.today.to_date # TODO: change to param for task
    puts "Rent Roll Report for #{given_date}"
    Unit.all.order(:number).each do |unit|
      puts "Unit #{unit.number} (Floor plan: #{unit.floor_plan})"
      unit.stays.move_out_after(given_date).order(:move_in).each do |stay|
        puts "  Resident: #{stay.name}, Status: #{stay.status_on(given_date)}, Move in: #{stay.move_in}, Move out: #{stay.move_out}"
      end
      unit.stays.where(move_out: nil).order(:move_in).each do |stay|
        puts "  Resident: #{stay.name}, Status: #{stay.status_on(given_date)}, Move in: #{stay.move_in}, Move out: #{stay.move_out}"
      end
    end
  end
end
