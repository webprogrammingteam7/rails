class RemoveEventFromTag < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :Event, :string
  end
end
