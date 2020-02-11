# frozen_string_literal: true

class DeviseAddTrackableAndLockable < ActiveRecord::Migration[5.2]
  def change
    ## Trackable
    add_column :admin_users, :sign_in_count, :integer, default: 0, null: false
    add_column :admin_users, :current_sign_in_at, :datetime
    add_column :admin_users, :last_sign_in_at, :datetime
    add_column :admin_users, :current_sign_in_ip, :string
    add_column :admin_users, :last_sign_in_ip, :string

    ## Lockable
    add_column :admin_users, :failed_attempts, :integer, default: 0, null: false # Only if lock strategy is :failed_attempts
    add_column :admin_users, :unlock_token, :string # Only if unlock strategy is :email or :both
    add_column :admin_users, :locked_at, :datetime
  end
end
