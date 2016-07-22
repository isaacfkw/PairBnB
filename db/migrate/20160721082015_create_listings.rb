class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string :name
    	t.string :description
    	t.integer :number_of_guest
    	t.integer :price
    	t.integer :user_id

      	t.timestamps null: false
    end
  end
end
