class AddAttribueToEquivalent < ActiveRecord::Migration[7.0]
  def change
    add_column :equivalents, :title, :string
    add_column :equivalents, :description, :string
  end
end
