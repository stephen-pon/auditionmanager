class AddGroupOrderToCastingGroup < ActiveRecord::Migration
  def change
    add_column :casting_groups, :group_order, :text
  end
end
