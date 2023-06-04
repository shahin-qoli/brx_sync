module Api
    class EquivalentSerializer < ActiveModel::Serializer

        attributes :id, :document, :json_data
    end
end