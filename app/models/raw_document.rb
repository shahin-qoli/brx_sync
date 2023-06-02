class RawDocument < ApplicationRecord
	has_many :equivalentment_requests
	belongs_to :equivalent
	def self.new_job_id
		if self.last.nil?	
			1
		else
			self.last.job_id + 1
		end
	end
end
