# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'v1/provider_operations/new', type: :view do
  before(:each) do
    assign(:v1_provider_operation, V1::ProviderOperation.new)
  end

  it 'renders new v1_provider_operation form' do
    render

    assert_select 'form[action=?][method=?]', v1_provider_operations_path, 'post' do
    end
  end
end
