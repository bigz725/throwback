# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
def import_pitch_types
  filename =  Rails.root.join(*%w(db pitch_types.csv) )
  types = CSV.read(filename, :headers => true)
  objs = []
  types.each do |row|
    objs << PitchType.from_csv_row(row)
  end
  binding.pry
  PitchType.import objs
end

import_pitch_types