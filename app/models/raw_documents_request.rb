class RawDocumentsRequest < ApplicationRecord
	belongs_to :equivalent
	has_many :raw_documents
	
	state_machine :initial => :requested do
		after_transition to: :requested, do: :make_request
		event :complete do 
			transition from: [:requested], to: :completed
		end

		event :create_equivalent do 
			transition from: :completed, to: :equivalent_created
		end
		after_transition to: :equivalent_created, do: :make_equivalent
		event :error do
			transition from: [:requested], to: :api_error
		end
	end

	def  make_request
 		jid=CreateRawDocumentsRequest.perform_async
 		j = self.update(jid: jid)
 		p j
	end
	def make_equivalent
		unproccessed = RawDocument.where(equivalent_id: nil)
		unproccessed.each do |up|
			equivalent = up.create_equivalent
		end
	end
end
