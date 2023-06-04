module Api
    class AttributeMappingSerializer < ActiveModel::Serializer

        attributes :id, :document, :json_data
    end
end