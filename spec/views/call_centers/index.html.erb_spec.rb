# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'call_centers/index', type: :view do
  before(:each) do
    assign(:call_centers, [
             CallCenter.create!,
             CallCenter.create!
           ])
  end

  it 'renders a list of call_centers' do
    render
  end
end
