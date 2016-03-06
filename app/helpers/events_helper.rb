module EventsHelper
  def link_to_day_before
    day = date.yesterday
    link_to readable_date(day), events_path(date: day)
  end

  def link_to_day_after
    day = date.tomorrow
    link_to readable_date(day), events_path(date: day)
  end

  def readable_date(d)
    d.strftime("%a %b %d")
  end

  def date
    params[:date].present? ? Date.parse(params[:date]) : Date.today
  end
end
