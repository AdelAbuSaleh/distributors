# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'call_centers/edit', type: :view do
  before(:each) do
    @call_center = assign(:call_center, CallCenter.create!)
  end

  it 'renders the edit call_center form' do
    render

    assert_select 'form[action=?][method=?]', call_center_path(@call_center), 'post' do
    end
  end
end
