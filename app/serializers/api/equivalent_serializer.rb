module Api
    class EquivalentSerializer < ActiveModel::Serializer

        attributes :id, :document,:title, :description, :json_data
    end
end