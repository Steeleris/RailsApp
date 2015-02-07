class AddTopicToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :topic, :string
  end
end
