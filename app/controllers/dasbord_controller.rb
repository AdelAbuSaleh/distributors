# frozen_string_literal: true

class DasbordController < ApplicationController
  power :dasbords, as: :dasbords_scope

  def index
    result = DasbordDistributorOperations.call(collection: dasbords_scope)
    if result.success?
      @distributor_operations = result.body
      # set up a client to talk to the Twilio REST API
      total_not_paid = total_operations_not_paid_for_current_orgnaization
      # send sms only to admin or employee for curren orgnaization
      NotificationsService.new(@current_user).send_message(total_not_paid)
    else
      flash.now[:message] = t(result.message)
      render :new
    end
  end

  def total_operations_not_paid_for_current_orgnaization
    @current_organization.distributor_operations.with_status(:not_paid).pluck(:total).sum
  end
end
