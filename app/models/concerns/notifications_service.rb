# frozen_string_literal: true

class NotificationsService
  def initialize(current_user)
    @current_user = current_user
  end

  # get the role form current users
  def admin_or_employee?
    role = @current_user.role.to_s
    return true if role.eql?('admin')
    return true if role.eql?('employee')

    false
  end

  def client
    Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']
  end

  def send_message(total_not_paid)
    return unless admin_or_employee?

    begin
      client.messages.create(
        from: '+12055284518',
        to: user_mobile_number,
        body: ensure_body(total_not_paid)
      )
    rescue Twilio::REST::TwilioError => e
    end
  end

  def user_mobile_number
    code_country = @current_user.country_code
    mobile = @current_user.mobile
    "+ #{code_country}" "#{mobile}"
  end

  def ensure_body(total_not_paid)
    return if total_not_paid.to_i < '50000'.to_i

    "المبلغ المتبقي عليكم  للموزع هو : #{total_not_paid}"
  end
end
