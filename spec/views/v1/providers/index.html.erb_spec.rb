# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'v1/providers/index', type: :view do
  before(:each) do
    assign(:v1_providers, [
             V1::Provider.create!,
             V1::Provider.create!
           ])
  end

  it 'renders a list of v1/providers' do
    render
  end
end
