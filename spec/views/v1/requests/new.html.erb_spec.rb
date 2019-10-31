require 'rails_helper'

RSpec.describe "v1/requests/new", type: :view do
  before(:each) do
    assign(:v1_request, V1::Request.new())
  end

  it "renders new v1_request form" do
    render

    assert_select "form[action=?][method=?]", v1_requests_path, "post" do
    end
  end
end
