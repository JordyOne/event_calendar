# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

# create Track data
  Track.create(name: "General")
  Track.create(name: "Pattern Recognition")
  Track.create(name: "Image, Speech, and Signal Processing")
  Track.create(name: "Document Analysis")
  Track.create(name: "Biometrics")
  Track.create(name: "Bioinformatics")

  puts "CREATED TRACK CATEGORIES"

# import csv data
  CSV.foreach("#{Rails.public_path}/seed_data/test_events.csv", :headers => true) do |row|
    row_hash = row.to_hash

    # normalize data
      start = DateTime.strptime(row_hash["start"], '%m/%d/%Y %k:%M')
      finish = DateTime.strptime(row_hash["finish"], '%m/%d/%Y %k:%M')
      name = row_hash["name"]
    # add 1 to match up with track table index
      track_id = row_hash["track"].gsub(/\D/, '').to_i + 1
      track_id = 1 if track_id.blank?


    # create events
      event = Event.create!(start: start, finish: finish, name: name, track_id: track_id)
      puts "CREATED EVENT: #{event.track_id}"
  end
