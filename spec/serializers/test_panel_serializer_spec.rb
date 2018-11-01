describe TestPanelSerializer do

  let(:test_panel) { TestPanel.find_by('tp2') }

  subject { TestPanelSerializer.new(test_panel) }

  describe '.as_json' do
    let(:expected_result) {
      {
        data: {
          type: "test_panels",
          id: "TP2",
          attributes: {
            price: 2100,
            sample_tube_types: ["purple", "yellow"],
            sample_volume_requirement: 220
          },
          relationships: {
            test: {
              data: [
                { id: "HBA1C", type: "test"},
                { id: "B12", type: "test"}
              ]
            }
          }
        }
      }
    }

    it "should generate the expected json" do
      expect(subject.as_json).to eql(expected_result)
    end

  end
end
