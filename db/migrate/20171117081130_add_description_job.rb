class AddDescriptionJob < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :description, :text
  end
end
