class DeleteColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column(:build_sessions, :minutes)
  end
end
