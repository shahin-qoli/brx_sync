class GetDocumentsService
	include HTTParty
	def initialize(request_url, request_method, request_body={}, request_system, job_id)
		@request_url = request_url
		@request_method = request_method
		@request_body = request_body
		@request_system = request_system
		@job_id = job_id
	end

	def make_request
		options = {body: @request_body }
		case @request_method
		when get
			response = self.class.get(@request_url)
		when post 
			response = self.class.post(@request_url, options)
		end

		{ response: handle_response(response), created_rows: get_created_rows }
	end

	def handle_response(response)
		if response.success?
			data = response.body
			data.each |json| do
				RawDocument.create(raw_data: json, document_source: @request_system, job_id: @job_id)
			end
		else
			raise "API request failed with code #{response.code}"
		end
	end
	def get_created_rows
		result = RawDocument.find_by_job_id(@job_id)
  	 	{ created_rows: result.count, job_id: @job_id }
 	end

end
