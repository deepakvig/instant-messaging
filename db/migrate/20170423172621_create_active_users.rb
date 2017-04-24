class CreateActiveUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :active_users do |t|
      t.string :username
      t.integer :user_session_id

      t.timestamps
    end
  end
end
