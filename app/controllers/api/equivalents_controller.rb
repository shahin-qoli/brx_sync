class Api::EquivalentsController < ApiController
	include JsonHelper
	def model_class
		Equivalent
	end
	def collection_serializer
		Api::EquivalentSerializer
	end
	def get_attributes
		document = model_class.find(params[:id])
		render json: extract_attribute_paths(document.json_data)
	end
	def create_params
		params.require(:equivalent).permit(:title, :description, :document_id, json_data: {})
	end	
end
