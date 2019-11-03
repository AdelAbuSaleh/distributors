# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'v1/orgnaizations/new', type: :view do
  before(:each) do
    assign(:v1_orgnaization, V1::Orgnaization.new)
  end

  it 'renders new v1_orgnaization form' do
    render

    assert_select 'form[action=?][method=?]', v1_orgnaizations_path, 'post' do
    end
  end
end
