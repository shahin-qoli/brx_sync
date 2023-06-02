class CreateEquivalents < ActiveRecord::Migration[7.0]
  def change
    create_table :equivalents do |t|
      t.references  :document
      t.jsonb :json_data
      t.timestamps
    end
  end
end
