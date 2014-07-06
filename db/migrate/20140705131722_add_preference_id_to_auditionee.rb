class AddPreferenceIdToAuditionee < ActiveRecord::Migration
  def change
    add_column :auditionees, :preference_id, :integer
  end
end
