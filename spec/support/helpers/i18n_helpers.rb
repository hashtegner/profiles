module I18nHelpers
  def t(*args)
    I18n.translate!(*args)
  end
end
