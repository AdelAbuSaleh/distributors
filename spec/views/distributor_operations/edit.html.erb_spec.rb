require 'rails_helper'

RSpec.describe "distributor_operations/edit", type: :view do
  before(:each) do
    @distributor_operation = assign(:distributor_operation, DistributorOperation.create!())
  end

  it "renders the edit distributor_operation form" do
    render

    assert_select "form[action=?][method=?]", distributor_operation_path(@distributor_operation), "post" do
    end
  end
end
