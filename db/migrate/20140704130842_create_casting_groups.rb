class CreateCastingGroups < ActiveRecord::Migration
  def change
    create_table :casting_groups do |t|
      t.text :video

      t.timestamps
    end
  end
end
