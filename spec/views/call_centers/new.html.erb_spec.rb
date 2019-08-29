# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'call_centers/new', type: :view do
  before(:each) do
    assign(:call_center, CallCenter.new)
  end

  it 'renders new call_center form' do
    render

    assert_select 'form[action=?][method=?]', call_centers_path, 'post' do
    end
  end
end
