class AddCreatorIdToInvite < ActiveRecord::Migration[6.1]
  def change
    add_column :invites, :event_invitee_id, :integer
    add_column :invites, :invited_event_id, :integer
  end
end
