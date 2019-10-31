require 'rails_helper'

RSpec.describe "v1/orgnaizations/edit", type: :view do
  before(:each) do
    @v1_orgnaization = assign(:v1_orgnaization, V1::Orgnaization.create!())
  end

  it "renders the edit v1_orgnaization form" do
    render

    assert_select "form[action=?][method=?]", v1_orgnaization_path(@v1_orgnaization), "post" do
    end
  end
end
