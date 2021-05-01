ActiveAdmin.register User do

  
  
  index do
    selectable_column
    column :id
    column :username
    column :first_name
    column :last_name
    column :role_id
    column :email
    column :created_at
    column :updated_at
    column :approved
    column :actions do |item|
      links = []
      links << link_to('Show', admin_user_path(item))
      links << link_to('Edit', edit_admin_user_path(item))
      links << link_to('Delete', admin_user_path(item), method: :delete, confirm: 'Are you sure?')
      links.join(' ').html_safe
    end
    
  end


  filter :id
  filter :username
  filter :first_name
  filter :last_name
  filter :role_id
  filter :email
  filter :created_at
  filter :updated_at

end
