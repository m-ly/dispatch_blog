module ApplicationHelper
  def truncate_post(text)
    "#{text[0..500]}..."
  end 
end
