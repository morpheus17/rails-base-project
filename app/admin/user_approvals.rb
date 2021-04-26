ActiveAdmin.register_page "Broker Approvals" do
  content do
    para "Hello World"
  end

  content only: :index do
    render 'index'
  end

  controller do
     def index
     end
  end
end