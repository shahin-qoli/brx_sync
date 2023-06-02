module JsonHelper
  def extract_attribute_paths(json_object, parent_path = '')
    attribute_paths = []

    json_object.each do |key, value|
      current_path = parent_path.empty? ? key.to_s : "#{parent_path}.#{key}"

      if value.is_a?(Hash)
        attribute_paths.concat(extract_attribute_paths(value, current_path))
      else
        attribute_paths << current_path
      end
    end

    attribute_paths
  end
end