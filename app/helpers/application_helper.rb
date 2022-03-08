module ApplicationHelper

  def translate(object, attribute)
    output = eval("object.#{object.class.name.underscore}_translations.find_by(language_id: '#{I18n.locale}').#{attribute}")
    output.nil? ? "" : output
  end

  def file_icon(ext)
  	render("/shared/file.svg", ext: ext)
  end

  def link_to_add_fields(name, form, assoc)
    new_o=form.object.send(assoc).klass.new  ####
    id=new_o.object_id
    fields=form.fields_for(assoc,new_o,child_index: id) do |ff|
      render(assoc.to_s.singularize+"_fields",form: ff)
    end
    link_to name, "#", class: "add_nested_fields", data: {id: id, fields: fields.gsub("\n","")}
  end

  def seo_description(desc)
    truncate(strip_tags(desc), length: 160 )
  end

  
  def seo_image(target, field="image")
    begin
      return target.public_send("#{field}_url :medium")
    rescue
      nil
    end
  end
end