class ChangeSongs < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      add_column(:songs, :created_at, :datetime)
      add_column(:songs, :updated_at, :datetime)
    end
  end
end
