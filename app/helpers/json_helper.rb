module JsonHelper
  def extract_attribute_paths(json_object, parent_path = '')
    attribute_paths = []

    if json_object.is_a?(Hash)
      json_object.each do |key, value|
        current_path = parent_path.empty? ? key.to_s : "#{parent_path}.#{key}"
        attribute_paths.concat(extract_attribute_paths(value, current_path))
      end
    elsif json_object.is_a?(Array) && json_object.first.is_a?(Hash)
      json_object.each do |item|
        item.each do |item_key, item_value|
          item_path = "#{parent_path}.#{item_key}"
          attribute_paths.concat(extract_attribute_paths(item_value, item_path))
        end
      end
    else
      attribute_paths << parent_path
    end

    attribute_paths
  end

end