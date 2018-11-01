class TestPanel
  include ActiveModel::Serialization

  DATA = [
    {
      id: 'TP1',
      tests: ['CHO', 'VITD'],
      price: 1700
    },
    {
      id: 'TP2',
      tests: ['HBA1C', 'B12'],
      price: 2100
    },
    {
      id: 'TP3',
      tests: ['LFT', 'VITD', 'CHO'],
      price: 1800
    }
  ]

  def self.find_by(id)
    result = DATA.select { |test| test[:id] == id&.upcase }.first
    result.present? ? TestPanel.new(result) : nil
  end

  attr_reader :id, :tests, :price

  def initialize(data)
    @id = data[:id]
    @tests = data[:tests].map { |test_id| Test.find_by(test_id) }
    @price = data[:price]
  end

  def sample_tube_types
    tests.map { |test| test.sample_tube_type.to_s }.uniq
  end

  def sample_volume_requirement
    tests.inject(0) { |sum, test| sum + test.sample_volume_requirement }
  end
end
