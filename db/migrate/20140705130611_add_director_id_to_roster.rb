class AddDirectorIdToRoster < ActiveRecord::Migration
  def change
    add_column :rosters, :director_id, :integer
  end
end
