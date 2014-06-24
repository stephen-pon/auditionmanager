class CreateAuditionees < ActiveRecord::Migration
  def change
    create_table :auditionees do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :facebook_url
      t.string :gender

      t.timestamps
    end
  end
end
