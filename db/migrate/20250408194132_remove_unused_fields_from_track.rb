class RemoveUnusedFieldsFromTrack < ActiveRecord::Migration[7.2]
  def change
    remove_column :tracks, :filename, :string
    remove_column :tracks, :playlist, :text
  end
end
