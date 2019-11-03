# frozen_string_literal: true

json.extract! v1_request, :id, :created_at, :updated_at
json.url v1_request_url(v1_request, format: :json)
