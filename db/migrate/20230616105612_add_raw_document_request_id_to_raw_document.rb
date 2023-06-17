class AddRawDocumentRequestIdToRawDocument < ActiveRecord::Migration[7.0]
  def change
    add_column :raw_documents, :raw_documents_request_id, :integer
  end
end
