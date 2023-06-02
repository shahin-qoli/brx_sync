class CreateEquivalentmentRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :equivalentment_requests do |t|
      
      t.references :raw_document
      t.jsonb :request_body
      t.boolean :is_success
      t.jsonb :response
      
      t.timestamps
    end
  end
end
