class Test
  DATA = [
    {
      id: 'CHO',
      name: 'Cholesterol',
      sample_volume_requirement: 100,
      sample_tube_type: :yellow
    },
    {
      id: 'LFT',
      name: 'Liver function',
      sample_volume_requirement: 60,
      sample_tube_type: :yellow
    },
    {
      id: 'VITD',
      name: 'Vitamin D',
      sample_volume_requirement: 120,
      sample_tube_type: :yellow
    },
    {
      id: 'B12',
      name: 'Vitamin B12',
      sample_volume_requirement: 180,
      sample_tube_type: :yellow
    },
    {
      id: 'HBA1C',
      name: 'HbA1C',
      sample_volume_requirement: 40,
      sample_tube_type: :purple
    },
    {
      id: 'FBC',
      name: 'Full blood count',
      sample_volume_requirement: 80,
      sample_tube_type: :purple
    }
  ].freeze

  def self.find_by(id)
    result = DATA.select { |test| test[:id] == id }.first
    result.present? ? Test.new(result) : nil
  end

  attr_reader :id, :name, :sample_volume_requirement, :sample_tube_type

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @sample_volume_requirement = data[:sample_volume_requirement]
    @sample_tube_type = data[:sample_tube_type]
  end
end
