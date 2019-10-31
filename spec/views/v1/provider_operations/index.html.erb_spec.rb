require 'rails_helper'

RSpec.describe "v1/provider_operations/index", type: :view do
  before(:each) do
    assign(:v1_provider_operations, [
      V1::ProviderOperation.create!(),
      V1::ProviderOperation.create!()
    ])
  end

  it "renders a list of v1/provider_operations" do
    render
  end
end
