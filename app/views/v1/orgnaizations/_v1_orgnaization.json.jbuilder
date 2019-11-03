# frozen_string_literal: true

json.extract! v1_orgnaization, :id, :created_at, :updated_at
json.url v1_orgnaization_url(v1_orgnaization, format: :json)
