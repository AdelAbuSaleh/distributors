# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'v1/provider_operations/show', type: :view do
  before(:each) do
    @v1_provider_operation = assign(:v1_provider_operation, V1::ProviderOperation.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
