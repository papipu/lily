# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def trash_counter
    @trash.count.to_s+' '+Russian::p(@trash.count,'товар','товара','товаров')
  end
  def trash
    @trash
  end
end