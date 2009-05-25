class EmployeeMailer < ActionMailer::Base
   def reset_password(employee)   
     setup_email(employee)   
     @subject    += 'Link to reset your password'   
     @body[:url]  = "http://www.mysite.com/reset/#{employee.reset_password_code}"  
 
   protected   
   def setup_email(employee)     
     @recipients  = "#{employee.email}"   
     @from        = "support@mysite.com"   
     @subject     = "[mysite] "    
     @sent_on     = Time.now      
     @body[:employee] = employee  
   end 
   end

end
