class Layouts::Application < Mustache::Rails

  def stylesheet_includes
    stylesheet_link_tag :all
  end
  
  def javascript_includes
    javascript_include_tag :defaults
  end
  
  def security_meta_tag
    csrf_meta_tag
  end
  
  def page_title
    "Default"
  end
  
end
