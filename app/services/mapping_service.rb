class MappingService
  def create_mapping(equivalent, source_attribute, equivalent_attribute, nested_path = nil, fixed_amount = nil)
    AttributeMapping.create!(
      equivalent: equivalent,
      source_attribute: source_attribute,
      equivalent_attribute: equivalent_attribute,
      fixed_amount: fixed_amount
    )
  end

  def get_mappings(equivalent)
    equivalent.attribute_mappings
  end

  def update_mapping(mapping, source_attribute, equivalent_attribute, nested_path = nil, fixed_amount = nil)
    mapping.update!(
      source_attribute: source_attribute,
      equivalent_attribute: equivalent_attribute,
      fixed_amount: fixed_amount
    )
  end

  def delete_mapping(mapping)
    mapping.destroy
  end
end