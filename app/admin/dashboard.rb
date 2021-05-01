ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Welcome admin"
        span current_admin_user.email
        small "Go over the menu options to start "
      end
    end

    
    # columns do
    #   columns do
    #     panel "Info" do
    #       para "Welcome to the admin page."
    #     end
    #   end
    # end
    

  end # content
end
