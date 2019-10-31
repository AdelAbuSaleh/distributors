require 'rails_helper'

RSpec.describe "v1/users/edit", type: :view do
  before(:each) do
    @v1_user = assign(:v1_user, V1::User.create!())
  end

  it "renders the edit v1_user form" do
    render

    assert_select "form[action=?][method=?]", v1_user_path(@v1_user), "post" do
    end
  end
end
