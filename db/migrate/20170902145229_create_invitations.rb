class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.references :user, foreign_key: true
      t.references :meeting, foreign_key: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
