class ApiController < ActionController::API
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
	include ActionController::MimeResponds

	def index
		@search = model_class.ransack(params[:q]).result
		resources = @search.order(created_at: :desc).page(params[:page]).per(params[:per_page])
		options = { "count" => @search.size}
		# serilized = collection_serializer.new(resources, each_serializer: collection_serializer)
		respond_to do |format|
            format.json { render json:
                { options: options, data: ActiveModel::Serializer::CollectionSerializer.new(resources, serializer: collection_serializer)}
            }
        end	
	end
    def resource
    	scope = model_class.all
    	@resource = finder.new(scope: scope,params: params).execute
    end
	def show
		render json: model_class.find(params[:id]), status: 200
	end

	def create 
		obj = model_class.new(create_params)
		puts create_params
		puts "errrrooooos"
		obj.errors
		byebug
		if obj.save
			render json: obj, status:201
		else
		    render 	json: obj.errors, status:400
		end
	end

	def destroy
		obj = model_class.find(params[:id])
		obj.destroy

        render json:"removed successfully", status: 200
	end
	def update 
		obj = model_class.find(params[:id])
		if obj.update(permitted_attibutes)
			render json: obj, status:200
		else
			render 	json: obj.errors, status:400
		end
	end

	def collection
		model_class.all
	end
	def record_not_found
		render json: {"result": false, "error": 'Not Found'}
	end


end