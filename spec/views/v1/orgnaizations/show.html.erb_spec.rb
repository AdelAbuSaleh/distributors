require 'rails_helper'

RSpec.describe "v1/orgnaizations/show", type: :view do
  before(:each) do
    @v1_orgnaization = assign(:v1_orgnaization, V1::Orgnaization.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
