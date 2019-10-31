require 'rails_helper'

RSpec.describe "v1/providers/show", type: :view do
  before(:each) do
    @v1_provider = assign(:v1_provider, V1::Provider.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
