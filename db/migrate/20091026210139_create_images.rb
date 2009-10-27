class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer   :user_id
      t.string    :avatar_file_name
      t.string    :avatar_content_type
      t.string    :avatar_file_size
      t.datetime  :avatar_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
