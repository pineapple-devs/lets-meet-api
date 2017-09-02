class AddEmailToInvitation < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :email, :string
  end
end
