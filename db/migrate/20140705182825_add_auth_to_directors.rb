class AddAuthToDirectors < ActiveRecord::Migration
  def change
    add_column :directors, :password, :string
  end
end
