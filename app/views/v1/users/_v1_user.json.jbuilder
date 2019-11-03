# frozen_string_literal: true

json.extract! v1_user, :id, :created_at, :updated_at
json.url v1_user_url(v1_user, format: :json)
