class DasbordController < ApplicationController
  power :dasbords, as: :dasbords_scope

  def index
    debugger
    result = DasbordDistributorOperations.call(current_user: @current_user, current_organization: @current_organization)
    if result.success?
      @distributor_operations = result.body
    else
      flash.now[:message] = t(result.message)
      render :new
    end
  end
end
