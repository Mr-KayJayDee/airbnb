require 'date'

module ApplicationHelper
  def number_with_delimiter(number, delimiter: ',', separator: '.')
    begin
      parts = number.to_s.split(separator)
      parts[0].gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{delimiter}")
      parts.join(separator)
    rescue
      number
    end
  end

  def calculate_amout_paid(booking, isStats = false)
    # get the day of the date
    start_date = DateTime.parse(booking.start_date.to_s)
    end_date = DateTime.parse(booking.end_date.to_s)

    # calculate the number of days
    amount_paid = 0
    if isStats
      if booking.state == "completed" || booking.state == "reviewed" || booking.state == "accepted"
        number_of_days = (end_date - start_date).to_i + 1
        amount_paid = number_of_days * booking.car.price_per_day
      end
    else
      number_of_days = (end_date - start_date).to_i + 1
      amount_paid = number_of_days * booking.car.price_per_day
    end

    return amount_paid
  end
end
