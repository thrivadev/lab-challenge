# "data": {
#   "type": "test_panels",
#   "id": "TP2",
#   "attributes": {
#     "price": 2100,
#     "sample_tube_types": ["purple", "yellow"],
#     "sample_volume_requirement": 220
#   },
#   "relationships": {
#     "test": {
#       "data": [
#         { "id": "B12", "type": "test"},
#         { "id": "HBA1C", "type": "test"}
#       ]
#     }
#   }
# }
class TestPanelSerializer < ActiveModel::Serializer
  attributes :data

  def data
    {
      type: 'test_panels',
      id: object.id,
      attributes: test_panel_attrs,
      relationships: relationships
    }
  end

  def relationships
    {
      test: {
        data: test_data
      }
    }
  end

  def test_panel_attrs
    {
      price: object.price,
      sample_tube_types: object.sample_tube_types,
      sample_volume_requirement: object.sample_volume_requirement
    }
  end

  def test_data
    object.tests.map { |test| { id: test.id, type: 'test'} }
  end

end
