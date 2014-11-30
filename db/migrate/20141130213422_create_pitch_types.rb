class CreatePitchTypes < ActiveRecord::Migration
  def up
    create_table :pitch_types, :id => false do |t|
      t.string :code, :limit => 20, :null => false
      t.boolean :strike
      t.boolean :swinging
      t.boolean :contact
      t.boolean :in_play
      t.boolean :bunt
      t.boolean :foul
      t.boolean :pitchout
      t.boolean :automatic
      t.boolean :tip
      t.boolean :blocked
      t.boolean :intentional
      t.boolean :hit_by_pitch
      t.boolean :interference
      t.boolean :out
      t.boolean :run
      
      t.string :description
      t.timestamps
    end
    execute("ALTER TABLE pitch_types ADD PRIMARY KEY (code)")
    
  end
  
  def down
    drop_table :pitch_types
  end
end
