module AttendancesHelper
  
  def worked_time(start, finish)
    format("%.2f", (((finish - start) / 60) / 60.0))
  end
  
  def start_time(start)
    start = start.round_to(15.minutes)
  end
  
  def finish_time(finish)
    finish = finish.round_to(15.minutes)
  end 
  
  def attendances_invalid?
    attendances = true
    attendances_params.each do |id, item|
      if item[:started_at].blank? && item[:finished_at].blank?
        next
      elsif item[:started_at].blank? || item[:finished_at].blank?
        attendances = false
        break
      elsif item[:started_at] > item[:finished_at]
        attendances = false
        break
      end
    end
    return attendances
  end
 
end
