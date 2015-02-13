# replaces problem with encoding from Clipped API
class String
  def clean
    self.gsub('â', '\'').html_safe
  end
end