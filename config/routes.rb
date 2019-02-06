Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get("/", {:controller => "calc", :action => "home_page"})
  
  get("/flexible/square/:the_num", {:controller => "calc", :action => "flex_square"})
  
  get("/square/results", {:controller => "calc", :action => "square_form_results"})
  get("/square/new", {:controller => "calc", :action => "square_form_entry"})
  
  get("/flexible/square_root/:the_root", {:controller => "calc", :action => "flex_square_root"})
  
  get("/square_root/results", {:controller => "calc", :action => "square_root_form_results"})
  get("/square_root/new", {:controller => "calc", :action => "square_root_form_entry"})
  
  get("/flexible/payment/:user_rate/:user_years/:user_principal", {:controller => "calc", :action => "flex_payment"})
  
  get("/payment/results", {:controller => "calc", :action => "payment_form_results"})
  get("/payment/new", {:controller => "calc", :action => "payment_form_entry"})
  
  get("/flexible/random/:minimum/:maximum", {:controller => "calc", :action => "flex_random"})
  
  get("/random/results", {:controller => "calc", :action => "random_form_results"})
  get("/random/new", {:controller => "calc", :action => "random_form_entry"})
  
end
