ActiveAdmin.register Stock do


  index do
    selectable_column
    column :id
    column :name
    column :amount
    column :quantity
    column :created_at
    column :updated_at
    column :actions do |item|
      links = []
      links << link_to('Show', admin_stock_path(item))
      links << link_to('Edit', edit_admin_stock_path(item))
      links << link_to('Delete', admin_stock_path(item), method: :delete, confirm: 'Are you sure?')
      links.join(' ').html_safe
    end
    
  end


  filter :id
  filter :name
  filter :amount
  filter :quantity
  filter :created_at
  filter :updated_at
  
end
