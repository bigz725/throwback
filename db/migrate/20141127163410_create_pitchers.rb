class CreatePitchers < ActiveRecord::Migration
  def up
    create_table :pitchers, :id => false do |t|
      t.string :pitcher_id, :limit => 10, :null => false
      t.string :first_name, :last_name
      t.string :throws, :limit => 1
      t.timestamps
      #t.index(:id, :name => "pitchers_pkey")
    end
    execute("ALTER TABLE pitchers ADD PRIMARY KEY (pitcher_id)")
  end
  
  def down
    drop_table :pitchers
  end
end
