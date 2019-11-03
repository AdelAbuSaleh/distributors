# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'v1/sessions/edit', type: :view do
  before(:each) do
    @v1_session = assign(:v1_session, V1::Session.create!)
  end

  it 'renders the edit v1_session form' do
    render

    assert_select 'form[action=?][method=?]', v1_session_path(@v1_session), 'post' do
    end
  end
end
