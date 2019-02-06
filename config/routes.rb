Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get("/flexible/square/:the_num", {:controller => "calc", :action => "flex_square"})
  
  get("/square/results", {:controller => "calc", :action => "square_form_results"})
  
  get("/flexible/square_root/:the_root", {:controller => "calc", :action => "flex_square_root"})
  
  get("/flexible/payment/:the_rate/:the_years/:the_principal", {:controller => "calc", :action => "flex_payment"})
  
end
