ActiveAdmin.register Transaction do

  filter :id
  filter :total_amount
  filter :price
  filter :quantity
  filter :created_at
  filter :updated_at
  filter :stock
  filter :seller
  filter :buyer
  
end
