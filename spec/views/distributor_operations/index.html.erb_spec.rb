# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'distributor_operations/index', type: :view do
  before(:each) do
    assign(:distributor_operations, [
             DistributorOperation.create!,
             DistributorOperation.create!
           ])
  end

  it 'renders a list of distributor_operations' do
    render
  end
end
