class AddEmailAndPushOptInToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :push_opt_in, :boolean, default: true
    add_column :users, :email_opt_in, :boolean, default: true
  end
end
