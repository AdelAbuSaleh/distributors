# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'call_centers/show', type: :view do
  before(:each) do
    @call_center = assign(:call_center, CallCenter.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
