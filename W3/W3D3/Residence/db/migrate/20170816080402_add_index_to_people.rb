class AddIndexToPeople < ActiveRecord::Migration[5.0]
  def change
    add_index :people, :house_id
  end
end
