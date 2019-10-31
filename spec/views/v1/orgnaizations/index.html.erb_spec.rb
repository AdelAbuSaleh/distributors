require 'rails_helper'

RSpec.describe "v1/orgnaizations/index", type: :view do
  before(:each) do
    assign(:v1_orgnaizations, [
      V1::Orgnaization.create!(),
      V1::Orgnaization.create!()
    ])
  end

  it "renders a list of v1/orgnaizations" do
    render
  end
end
