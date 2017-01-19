module ApplicationHelper

  # provide title on page basis
  def full_title(title = '')
    base_title = 'SimpleCms'
    if title.empty?
      base_title
    else
      base_title + " | " + title
    end
  end
end
