module AttendencesHelper
  def now
    Time.zone.now
  end

  def current_month
    Date.today.strftime('%Y-%m')
  end

  def mins_from_midnight(date)
    hours = date.strftime('%H')
    minutes = date.strftime('%M')
    (hours.to_i * 60) + minutes.to_i
  end

  def to_datetime(minutes)
    hour = minutes / 60
    min = ((minutes.to_f / 60.to_f)).modulo(1) * 60
    now.change({ hour:, min: min.to_i })
  end

  def calculate_new_avg_check_of(avg_check_in_minutes, n_checks)
    now_in_minutes = mins_from_midnight(now)
    ((avg_check_in_minutes * n_checks) + now_in_minutes) / (n_checks + 1)
  end
end
