class AddAdoptableToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :adoptable_status, :string
  end
end
