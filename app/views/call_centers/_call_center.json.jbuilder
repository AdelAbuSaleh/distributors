# frozen_string_literal: true

json.extract! call_center, :id, :created_at, :updated_at
json.url call_center_url(call_center, format: :json)
