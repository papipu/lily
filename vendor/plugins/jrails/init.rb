# uncomment to use jQuery.noConflict()
#ActionView::Helpers::PrototypeHelper::JQUERY_VAR = 'jQuery'

ActionView::Helpers::AssetTagHelper::JAVASCRIPT_DEFAULT_SOURCES =
  ['jquery','jquery-ui','jrails','ckeditor/ckeditor.js','ckeditor/adapters/jquery.js','lightbox']
ActionView::Helpers::AssetTagHelper::reset_javascript_include_default
require 'jrails'
