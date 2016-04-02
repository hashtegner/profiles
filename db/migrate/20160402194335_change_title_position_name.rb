class ChangeTitlePositionName < ActiveRecord::Migration[5.0]
  def change
    rename_column :profiles, :title_position, :profession
  end
end
