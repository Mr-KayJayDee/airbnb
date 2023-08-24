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

  def calculate_amout_paid(start_date, end_date, price_per_day)
    # get the day of the date
    start_date = DateTime.parse(start_date.to_s)
    end_date = DateTime.parse(end_date.to_s)

    # calculate the number of days
    number_of_days = (end_date - start_date).to_i + 1

    amount_paid = number_of_days * price_per_day

    return amount_paid
  end
end
