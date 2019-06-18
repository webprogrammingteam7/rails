class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :text
      t.datetime :date
      t.string :location
      t.string :image
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
