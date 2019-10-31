require 'rails_helper'

RSpec.describe "v1/providers/new", type: :view do
  before(:each) do
    assign(:v1_provider, V1::Provider.new())
  end

  it "renders new v1_provider form" do
    render

    assert_select "form[action=?][method=?]", v1_providers_path, "post" do
    end
  end
end
