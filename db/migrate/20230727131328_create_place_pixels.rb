class CreatePlacePixels < ActiveRecord::Migration[7.0]
  def change
    create_table :place_pixels do |t|
      t.integer :x
      t.integer :y
      t.string :color

      t.timestamps
    end
  end
end
