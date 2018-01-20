class AddCompletedField < ActiveRecord::Migration[5.1]
  def change
    add_column(:build_sessions, :completed?, :boolean)
  end
end
