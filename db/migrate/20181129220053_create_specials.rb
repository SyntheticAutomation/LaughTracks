class CreateSpecials < ActiveRecord::Migration[5.2]
  def change
    create_table :specials do |t|
      t.string :title
      t.integer :runtime
      t.string :image
      t.integer :comedian_id
      t.timestamps null: false
    end
  end
end
