class AddCreatorIdToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :event_creator_id, :integer
  end
end
