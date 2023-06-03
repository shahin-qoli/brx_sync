class Api::DocumentsController < ApiController
	helper JsonHelper

	def model_class
		Document
	end
	def collection_serializer
		Api::DocumentSerializer
	end
end
