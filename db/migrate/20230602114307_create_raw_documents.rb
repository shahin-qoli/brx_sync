class CreateRawDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :raw_documents do |t|
      t.jsonb :raw_data
      t.string :document_source
      t.integer :job_id
      t.boolean :is_synced, default: false
      t.references :equivalent

      t.timestamps
    end
  end
end
