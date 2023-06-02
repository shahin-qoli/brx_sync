class Equivalent < ApplicationRecord
	belongs_to :document
	has_many :attribute_mappings
	has_many :raw_documents
	

	serialize :user_defined_json, JSON
end
