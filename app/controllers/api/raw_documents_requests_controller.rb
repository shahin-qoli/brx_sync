class Api::RawDocumentsRequestsController < ApiController
	



	def create
		body = create_params
		request_body = JSON.parse(create_params[:request_body])
		create_params[:request_body] = request_body
		obj = model_class.new(create_params)
		if obj.save
			render json: obj, status:201
		else
		    render 	json: obj.errors, status:400
		end
	end
	def model_class
		RawDocumentsRequest
	end
	
	def create_params
		params.require(:raw_documents_request).permit(:equivalent_id, :request_link, :request_type, :request_docs_array, :request_body)
	end	
end
