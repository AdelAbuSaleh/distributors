require 'rails_helper'

RSpec.describe "v1/sessions/new", type: :view do
  before(:each) do
    assign(:v1_session, V1::Session.new())
  end

  it "renders new v1_session form" do
    render

    assert_select "form[action=?][method=?]", v1_sessions_path, "post" do
    end
  end
end
