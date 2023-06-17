class CreateRawDocumentsRequest
	include Sidekiq::Worker
	sidekiq_options retry: false
	def perform
      
      sleep(3)
      job = RawDocumentsRequest.find_by_jid(@jid)
      request_url  = job.request_link
      body = job.request_body.to_json
      type = job.request_type
      array = job.request_docs_array
      document_source = job.equivalent.title
      equivalent_id = job.equivalent_id
      begin
        options = {
          headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
          },

          body: body
        }  
        if type =="post"
        response = HTTParty.post(request_url, options)
        response_object = response.parsed_response
        job.response = response_object
        if response.code == 200 && response_object[array]
          data = response_object[array]
          job_id = RawDocument.new_job_id
          data.each do |json_data|
            RawDocument.create(raw_data: json_data, document_source: document_source, equivalent_id: equivalent_id,
              raw_documents_request_id: job.id, job_id: job_id)
          end
          job.is_success = true
          job.job_id = job_id
          job.save

          job.complete!
        elsif response.code == 400
          job.error = response_object
          job.save
          job.error!
        else 
          job.save
        end
      rescue SocketError => e
        job.response = e
        job.save
        job.error!
      end
	end

  
end