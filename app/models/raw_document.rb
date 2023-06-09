class RawDocument < ApplicationRecord
	has_many :equivalentment_requests
	belongs_to :equivalent
	def self.new_job_id
		if self.last.nil?	
			1
		else
			self.last.job_id + 1
		end
	end
	def extract_attribute_paths(value = raw_data, parent_path = '')
		attribute_paths = []

		case value
		when Hash
		value.each do |key, sub_value|
		  current_path = parent_path.empty? ? key.to_s : "#{parent_path}.#{key}"
		  attribute_paths.concat(extract_attribute_paths(sub_value, current_path))
		end
		when Array
		value.each do |item|
		  attribute_paths.concat(extract_attribute_paths(item, parent_path))
		end
		else
		attribute_paths << parent_path
		end

		attribute_paths
	end	

	def something
		attribute_paths = self.equivalent.attribute_mappings.pluck(:source_attribute)
		attribute_values = attribute_paths.map { |path| find_value(raw_data, path) }

		# Recursive method to find the value based on the attribute path

	end 
	def find_value(data, path)
	  keys = path.split('.')
	  v = keys.inject(data) {|obj, part|  obj.is_a?(Hash) ? obj[part]: "its #{obj}"} 
	end

	def extract_attribute_values(json, attribute_path)
		path_components = attribute_path.split('.')

		current_value = json
		path_components.each do |component|
		if current_value.is_a?(Array)
		current_value = current_value.map { |item| item[component] }
		else
		current_value = current_value[component]
		end
	end

		current_value
	end
	def create_object(paths)
		arr_res = {}
		paths.each do |key, values|
		if values.is_a?(Array)
		  n = values.length
		  values.each_with_index do |value, index|
		    current = arr_res
		    parts = key.split(".")
		    parts[0...-2].each do |part|
		      current[part] ||= {}
		      current = current[part]
		    end
		    part = parts[-2]
		    current[part] ||= Array.new(n) { {} }
		    data = current[part][index]
		    data[parts.last] = value
		  end
		else
		  current = arr_res
		  parts = key.split('.')
		  parts[0...-1].each do |part|
		    current[part] ||= {}
		    current = current[part]
		  end
		  current[parts.last] = values
		end
		end
		arr_res
	end

end






