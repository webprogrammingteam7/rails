class AddIdToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :tag_id, :integer
  end
end
