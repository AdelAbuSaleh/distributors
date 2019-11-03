# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'v1/users/show', type: :view do
  before(:each) do
    @v1_user = assign(:v1_user, V1::User.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
