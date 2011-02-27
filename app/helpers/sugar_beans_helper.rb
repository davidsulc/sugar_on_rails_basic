module SugarBeansHelper
  def display_as_list(beans)
    html  = "<div class='container'>"
    html << "  <div class='container_header'>#{@module.capitalize}</div>" 
    html << "  <table class='beans'>" 
    beans.each do |bean|
      html << content_tag(:tr, :id => bean.id) do 
        content_tag(:td) do
          link_to(bean.name, sugar_bean_path(@module, bean.id))
        end
      end
    end
    html << "  </table>"
    html << "</div>"
  end
  
  def display(bean)
    html  = "<div class='bean'>"
    html << "  <ul>"
    bean.attributes.sort.each do |a|
      html << "    <li>#{a[0]}: #{a[1]}</li>"
    end
    html << "  </ul>"
    html << "</div>"
  end
  
end


