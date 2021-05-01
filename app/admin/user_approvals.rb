ActiveAdmin.register User, as: 'Broker Approvals' do
  menu label: 'Broker Approvals', priority: 3
  #menu :label => proc{ |u| u }
  
  config.clear_action_items!

  index do
    selectable_column
    column :id
    column :username
    column :first_name
    column :last_name
    column :email
    column :approved
    column :actions do |item|
      links = []
      links << link_to('Approve', approve_broker_path(item))
      links.join(' ').html_safe
    end
    
  end

  scope "All Users", :all
  scope "Pending approval", :unapproved_users

  controller do

    def approve 
      user = User.find_by_id(params[:id])
      user.approve_user
      user.save
      AdminMailer.broker_approved(user).deliver
      redirect_to admin_broker_approvals_path and return
    end
  end

  filter :id
  filter :username
  filter :first_name
  filter :last_name
  filter :email
end