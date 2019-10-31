require 'rails_helper'

RSpec.describe "v1/requests/edit", type: :view do
  before(:each) do
    @v1_request = assign(:v1_request, V1::Request.create!())
  end

  it "renders the edit v1_request form" do
    render

    assert_select "form[action=?][method=?]", v1_request_path(@v1_request), "post" do
    end
  end
end
