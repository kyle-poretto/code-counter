class DeleteTableAgain < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_timer
  end
end
