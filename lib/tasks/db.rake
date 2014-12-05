require 'csv'
require 'faker'
require 'set'
namespace :db do

  desc "Insert the data into the environment"
  task :prime => :environment do
    games = []
    pitchers = []
    batters = []
    pitches = []
    filename =  Rails.root.join(*%w(db commandfx_2014.csv) )
    row_count = 0
    already_seen_games = Set.new
    already_seen_pitchers = Set.new
    already_seen_batters = Set.new
    CSV.foreach(filename, :headers => true) do |row|
      if ((row_count % 1000) == 0 )
        puts "Processing row: #{row_count}"
      end
      game = create_game(row, already_seen_games)
      games << game unless game.blank?
      pitcher = create_pitcher(row, already_seen_pitchers)
      pitchers << pitcher unless pitcher.blank?
      batter = create_batter(row, already_seen_batters)
      batters << batter unless batter.blank?
      pitch = create_pitch(row)
      pitches << pitch unless pitch.blank?

      row_count = row_count + 1        
    end
    puts "CSV processed, beginning bulk import into MySQL"
    Game.transaction do
      Game.import games
      Pitcher.import pitchers
      Batter.import batters
      Pitch.import pitches
    end
    
    
  end
  
  desc "Remove the data from the environment"
  task :clear => :environment do
    ["pitches", "games", "batters", "pitchers"].each do |table|
      Pitcher.connection.execute("delete from #{table};")
    end
    
  end
  
  def create_batter(row, already_seen_set)
    id_column = "batter_id"
    if (already_seen_set.add?(row[id_column]))
      new_hash = {}
      new_hash['batter_id'] = row['batter_id']
      #fake names, just to look nicer (even if faker sometimes comes up with weird names)
      new_hash['first_name'] = Faker::Name.first_name
      new_hash['last_name'] = Faker::Name.last_name
      return Batter.new(new_hash)
    end
    return nil
  end
  
  def create_pitcher(row, already_seen_set)
    id_column = "pitcher_id"
    if (already_seen_set.add?(row[id_column]))
      new_hash = {}
      new_hash['pitcher_id'] = row['pitcher_id']
      new_hash['throws'] = row['pitcher_throws']
      #fake names, just to look nicer (even if faker sometimes comes up with weird names)
      new_hash['first_name'] = Faker::Name.first_name
      new_hash['last_name'] = Faker::Name.last_name
      return Pitcher.new(new_hash)
    end
    return nil
  end
  
  def create_game(row, already_seen_set)
    #game_date from the CSV row is a sanitized value perhaps representing a date
    #I will assume it's just a unique identifier, and will use Faker to create a real-fake(!) date
    #("real" meaning it is a syntactically correct date, "fake" meaning that probability says 
    #that this was not the actual date of the game
    if (already_seen_set.add?(row['game_date']))
      new_hash = {}
      new_hash['game_id'] = row['game_date']
      #Fake a date to help sort
      new_hash['game_date'] = Faker::Date.between(Date.new(2014, 4,1) , Date.new(2014, 9, 15) )
      return Game.new(new_hash)
    end
    return nil
  end
  
  def create_pitch(row)
    exclude_columns = ['created_at', 'updated_at', 'id', 'pitch_result_code']
    ##Pitch is the only class with a generated id, everything else gets all of its attributes from the CSV
    #We only want column names that can be fetched from the CSV, so exclude 'id', 'created_at', and 'updated_at'
    column_names = Pitch.column_names.delete_if{|col| exclude_columns.include?(col)}
    
     new_hash = {}
     column_names.each do |attr|
          new_hash[attr] = row[attr]
     end
     new_hash['game_id'] = row['game_date']
     new_hash['top_of_inning'] = (row['top_of_inning'] == 1)
     new_hash['pitch_result_code'] = row['pitch_result']
     retval = Pitch.new(new_hash)
     retval
    end


end
