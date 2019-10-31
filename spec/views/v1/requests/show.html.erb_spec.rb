require 'rails_helper'

RSpec.describe "v1/requests/show", type: :view do
  before(:each) do
    @v1_request = assign(:v1_request, V1::Request.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
