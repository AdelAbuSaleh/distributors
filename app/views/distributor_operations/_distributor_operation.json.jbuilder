# frozen_string_literal: true

json.extract! distributor_operation, :id, :created_at, :updated_at
json.url distributor_operation_url(distributor_operation, format: :json)
