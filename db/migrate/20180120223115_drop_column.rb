class DropColumn < ActiveRecord::Migration[5.1]
  def change
    def change
      delete_column(:build_sessions, :expected_pomo_periods)
      delete_column(:build_sessions, :actual_pomo_periods)
    end
  end
end
