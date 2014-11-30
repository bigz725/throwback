class RenamePitchType < ActiveRecord::Migration
  def change
    connection.execute("RENAME TABLE pitch_types TO pitch_results;")
  end
end
