class CreateUsersTimer < ActiveRecord::Migration[5.1]
  def change
    create_table :user_timer do |t|
      t.integer :user_id
      t.integer :build_session_id
      t.timestamps null: false
  end
end
end


