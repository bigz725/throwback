class CreateGames < ActiveRecord::Migration
  def up
    create_table :games, :id => false do |t|
      t.string :game_id, :limit => 10, :null => false
      t.date :game_date
      t.timestamps
      #t.index(:id, :name => "pitchers_pkey")
    end
    execute("ALTER TABLE games ADD PRIMARY KEY (game_id)")
  end
  
  def down
    drop_table :games
  end
end
