class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :property_type
      t.boolean :kitchen
      t.boolean :air_cond
      t.boolean :wifi
      t.boolean :non_smoking

      t.timestamps null: false
    end
  end
end
