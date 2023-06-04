2class CreateAttributeMappings < ActiveRecord::Migration[7.0]
  def change
    create_table :attribute_mappings do |t|
      t.references  :equivalent
      t.string :source_attribute
      t.string :equivalent_attribute
      t.string :fixed_amount
      t.boolean :uniquer, default: false
      t.timestamps
    end
  end
end
