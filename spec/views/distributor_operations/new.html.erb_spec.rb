# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'distributor_operations/new', type: :view do
  before(:each) do
    assign(:distributor_operation, DistributorOperation.new)
  end

  it 'renders new distributor_operation form' do
    render

    assert_select 'form[action=?][method=?]', distributor_operations_path, 'post' do
    end
  end
end
