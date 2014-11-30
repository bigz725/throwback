class PitchType < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible *column_names
  def self.from_csv_row(csv)
    exclude_columns = ['created_at', 'updated_at']
    col_names = column_names.delete_if{|col| exclude_columns.include?(col)}
    attrs = {}
    col_names.each do |col|
      attrs[col] = csv[col]
    end
    new(attrs)
  end
end
