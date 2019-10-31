require 'rails_helper'

RSpec.describe "v1/providers/edit", type: :view do
  before(:each) do
    @v1_provider = assign(:v1_provider, V1::Provider.create!())
  end

  it "renders the edit v1_provider form" do
    render

    assert_select "form[action=?][method=?]", v1_provider_path(@v1_provider), "post" do
    end
  end
end
