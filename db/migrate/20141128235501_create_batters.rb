class CreateBatters < ActiveRecord::Migration
  def up
    create_table :batters, :id => false do |t|
      t.string :batter_id, :limit => 10, :null => false
      t.string :first_name, :last_name
      t.string :stance, :limit => 1
      t.timestamps
      #t.index(:id, :name => "pitchers_pkey")
    end
    execute("ALTER TABLE batters ADD PRIMARY KEY (batter_id)")
  end
  
  def down
    drop_table :batters
  end
end
