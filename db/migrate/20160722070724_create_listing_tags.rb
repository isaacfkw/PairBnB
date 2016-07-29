class CreateListingTags < ActiveRecord::Migration
  def change
    create_table :listing_tags do |t|
      t.integer :listing_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
