class AddSectionNumberToSections < ActiveRecord::Migration
  def change
    add_column :sections, :subtitle, :string
  end
end
