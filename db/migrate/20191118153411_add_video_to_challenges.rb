class AddVideoToChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :challenges, :video_link, :string
  end
end
