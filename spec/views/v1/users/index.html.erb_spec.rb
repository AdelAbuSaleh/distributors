require 'rails_helper'

RSpec.describe "v1/users/index", type: :view do
  before(:each) do
    assign(:v1_users, [
      V1::User.create!(),
      V1::User.create!()
    ])
  end

  it "renders a list of v1/users" do
    render
  end
end
