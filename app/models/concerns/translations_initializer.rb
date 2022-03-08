module TranslationsInitializer
  extend ActiveSupport::Concern

  included do
    after_initialize :initialize_translations, if: :new_record?
  end

  def initialize_translations
    class_name = self.class.name.underscore
    I18n.available_locales.each do |locale|
      eval("self.#{class_name}_translations.build(language_id: locale) unless self.#{class_name}_translations.map(&:language_id).include?('#{locale.to_s}')")
    end
  end

end