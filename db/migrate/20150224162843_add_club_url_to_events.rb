class AddClubUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :club_url, :string
  end
end
