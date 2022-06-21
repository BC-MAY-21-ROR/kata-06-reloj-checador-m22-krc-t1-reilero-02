module EmployeesHelper
  def status_label(current_status)
    current_status ? 'Deactivate' : 'Activate'
  end

  def button_status(current_status)
    current_status ? 'btn-outline-danger' : 'btn-outline-success'
  end
end
