# frozen_string_literal: true

json.extract! v1_invoice, :id, :created_at, :updated_at
json.url v1_invoice_url(v1_invoice, format: :json)
