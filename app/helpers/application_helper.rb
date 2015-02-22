module ApplicationHelper
  def full_title(title)
    title.blank? ? 'techAtlanta' : "techAtlanta | #{title}"
  end
end
