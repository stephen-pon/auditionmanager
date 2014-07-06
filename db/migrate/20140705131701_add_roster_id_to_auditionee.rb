class AddRosterIdToAuditionee < ActiveRecord::Migration
  def change
    add_column :auditionees, :roster_id, :integer
  end
end
