class RemoveIooFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_reference :events, :tag, foreign_key: true
  end
end
