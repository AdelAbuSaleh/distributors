require 'rails_helper'

RSpec.describe "v1/users/new", type: :view do
  before(:each) do
    assign(:v1_user, V1::User.new())
  end

  it "renders new v1_user form" do
    render

    assert_select "form[action=?][method=?]", v1_users_path, "post" do
    end
  end
end
