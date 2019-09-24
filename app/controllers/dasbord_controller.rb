# frozen_string_literal: true

class DasbordController < ApplicationController
  power :dasbords, as: :dasbords_scope

  def index
    result = DasbordDistributorOperations.call(collection: dasbords_scope)
    if result.success?
      @distributor_operations = result.body
    else
      flash.now[:message] = t(result.message)
      render :new
    end
  end
end
