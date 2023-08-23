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
end
