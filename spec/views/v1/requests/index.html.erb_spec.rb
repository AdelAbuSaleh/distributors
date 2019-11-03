# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'v1/requests/index', type: :view do
  before(:each) do
    assign(:v1_requests, [
             V1::Request.create!,
             V1::Request.create!
           ])
  end

  it 'renders a list of v1/requests' do
    render
  end
end
