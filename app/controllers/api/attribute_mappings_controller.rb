class Api::AttributeMappingsController < ApiController
	def model_class
		AttributeMapping
	end
	def collection_serializer
		Api::AttributeMappingSerializer
	end
	def create_mapping
		equivalent_id = params[:equivalent_id]
		data = params[:data]
		data.each |attr| do
			model_class.create(equivalent_id: equivalent_id, source_attribute: atrr.source_attribute,
				equivalent_attribute: attr.equivalent_attribute, fixed_amount: attr.&fixed_amount,
				uniquer: attr.&uniquer)
		end
	end
				
end
