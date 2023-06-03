module Api
    class DocumentSerializer < ActiveModel::Serializer

        attributes :id, :title, :description, :json_data
    end
end