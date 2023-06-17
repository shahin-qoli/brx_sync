class RawDocumentsRequest < ActiveRecord::Migration[7.0]
  def change
    create_table :raw_documents_requests do |t|
      
      t.references :equivalent
      t.jsonb :request_body
      t.string :request_link
      t.string :request_type
      t.string :request_docs_array
      t.boolean :is_success, default: false
      t.jsonb :response
      t.string :jid
      t.integer :job_id
      t.string :state
      
      t.timestamps
    end
  end
end
