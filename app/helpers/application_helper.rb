module ApplicationHelper
  def module_menu
    html = ""
    ["Accounts", "Opportunities", "Users"].each do |m|
      html << content_tag(:li, :class => :module) do 
        link_to(m, module_path(m.downcase))
      end
    end
    html
  end
end
