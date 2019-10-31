require 'rails_helper'

RSpec.describe "v1/sessions/index", type: :view do
  before(:each) do
    assign(:v1_sessions, [
      V1::Session.create!(),
      V1::Session.create!()
    ])
  end

  it "renders a list of v1/sessions" do
    render
  end
end
