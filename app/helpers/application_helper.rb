module ApplicationHelper
  def full_title page_title = ""
    base_title = I18n.t("app")
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def header_title title = ""
    title.empty? ? "" : title
  end
end
