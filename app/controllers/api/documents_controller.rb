class Api::DocumentsController < ApiController
	include JsonHelper

	def model_class
		Document
	end
	def collection_serializer
		Api::DocumentSerializer
	end
	def get_attributes
		document = model_class.find(params[:id])
		render json: extract_attribute_paths(document.json_data)
	end
end
