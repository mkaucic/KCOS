module TagsHelper
  def render_with_tags(text)
    text.gsub(/#\w+/){|word| link_to word.delete("#"), "/tag/#{word.downcase.delete('#')}", class: 'tag' }.html_safe
  end
end
