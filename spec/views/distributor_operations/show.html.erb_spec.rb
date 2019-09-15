# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'distributor_operations/show', type: :view do
  before(:each) do
    @distributor_operation = assign(:distributor_operation, DistributorOperation.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
