class AddCastingGroupIdToAuditionees < ActiveRecord::Migration
  def change
    add_column :auditionees, :casting_group_id, :integer
  end
end
