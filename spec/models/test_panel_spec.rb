require 'rails_helper'

describe TestPanel, type: :model do
  it 'should store the data in a DATA constant' do
    expect(TestPanel::DATA.length > 0).to eq true
  end

  describe '#find_by' do
    it 'should return the correct test_panel' do
      result = TestPanel.find_by('tp3')
      expect(result.price).to eql(1800)
    end

    it 'should return nil if an invalid ID is provided' do
      expect(TestPanel.find_by('INVALID')).to be_nil
    end
  end

  describe '.sample_tube_types' do
    it 'returns the list of tube types required for the tests' do
      test_panel = TestPanel.find_by('TP3')
      expect(test_panel.sample_tube_types).to eql(['yellow'])
    end
  end

  describe '.sample_volume_requirement' do
    it 'returns the sample volume required for the tests' do
      test_panel = TestPanel.find_by('TP3')
      expect(test_panel.sample_volume_requirement).to eql(280)
    end
  end
end
