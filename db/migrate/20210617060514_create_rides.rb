class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.integer :user_id
      t.integer :attraction_id

      t.timestamps
    end
  end
end
