class Api::AttributeMappingsController < ApiController
	def model_class
		AttributeMapping
	end
	def collection_serializer
		Api::AttributeMappingSerializer
	end
def create_mapping

	puts params[:equivalent_id]

  equivalent_id = params[:equivalent_id]
  data = params[:data]
  
  data.each do |object|
  		puts "PUTTTIN"
  	puts object
    model_class.create(
      equivalent_id: equivalent_id,
      source_attribute: object["mainAttribute"],
      equivalent_attribute: object["equivalentAttribute"],
      fixed_amount: object["fixedAmount"],
      uniquer: object["uniquer"]
    )
  end
end

	def retrieve_attributes
		equivalent = Equivalent.find(params[:equivalent_id])
		equivalent_attributes = equivalent.extract_attribute_paths
		document_attributes = equivalent.document.extract_attribute_paths
		render :json => { "equivalent_attributes" => equivalent_attributes, "document_attributes" => document_attributes}
	end				
end
