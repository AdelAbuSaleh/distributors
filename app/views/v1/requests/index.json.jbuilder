# frozen_string_literal: true

json.array! @v1_requests, partial: 'v1_requests/v1_request', as: :v1_request
