class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :description
      t.jsonb :json_data
      t.timestamps
    end
  end
end
