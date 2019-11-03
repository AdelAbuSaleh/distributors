# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'v1/provider_operations/edit', type: :view do
  before(:each) do
    @v1_provider_operation = assign(:v1_provider_operation, V1::ProviderOperation.create!)
  end

  it 'renders the edit v1_provider_operation form' do
    render

    assert_select 'form[action=?][method=?]', v1_provider_operation_path(@v1_provider_operation), 'post' do
    end
  end
end
