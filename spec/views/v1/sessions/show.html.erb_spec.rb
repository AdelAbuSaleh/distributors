require 'rails_helper'

RSpec.describe "v1/sessions/show", type: :view do
  before(:each) do
    @v1_session = assign(:v1_session, V1::Session.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
