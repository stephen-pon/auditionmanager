class AddDirectorIdToPreference < ActiveRecord::Migration
  def change
    add_column :preferences, :director_id, :integer
  end
end
