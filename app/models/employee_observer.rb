class EmployeeObserver < ActiveRecord::Observer
    def after_save(employee)   
      EmployeeMailer.deliver_reset_password(employee) if employee.recently_reset?  
    end
end
