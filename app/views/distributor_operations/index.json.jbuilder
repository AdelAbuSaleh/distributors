# frozen_string_literal: true

json.array! @distributor_operations, partial: 'distributor_operations/distributor_operation', as: :distributor_operation
