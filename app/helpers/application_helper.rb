module ApplicationHelper

  def datetime(date)
    date.strftime('%d/%m/%Y %H:%M') unless date.blank?
  end

end
