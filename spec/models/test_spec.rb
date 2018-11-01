require 'rails_helper'

describe Test, type: :model do
  it 'should store the data in a DATA constant' do
    expect(Test::DATA.length > 0).to eq true
  end

  describe '#find_by' do
    it 'should return the correct test' do
      result = Test.find_by('LFT')
      expect(result.name).to eql('Liver function')
    end

    it 'should return nil if an invalid ID is provided' do
      expect(Test.find_by('INVALID')).to be_nil
    end
  end
end
