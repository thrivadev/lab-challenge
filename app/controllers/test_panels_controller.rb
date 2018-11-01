class TestPanelsController < ApplicationController

  def show
    test_panel = TestPanel.find_by(params[:id])
    if test_panel
      render json: TestPanelSerializer.new(test_panel).as_json and return
    end

    render json: { error: 'invalid code' }, code: 404
  end
end
