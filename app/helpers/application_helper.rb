module ApplicationHelper
  def display_datetime(dt)
    if logged_in? && !current_user.time_zone.blank?
      dt = dt.in_time_zone(current_user.time_zone)
    end
    dt.strftime("%m/%d/%Y %l:%M%P %Z")
  end
  
  def display_field(f)
      f = f.gsub("\r\n", "<br/>")
  end
end
