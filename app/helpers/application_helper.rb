module ApplicationHelper
  def lang_switcher(options={})
    options = {
        root_path: 'root_path',
        active_class: 'active',
        wrapper_class: 'lang-switcher clearfix',
        wrapper_tag: :ul,
        without_locales: [],
        item_tag: :li
    }.merge(options)

    links = {}

    I18n.available_locales.each do |loc|
      locale_param = request.path == options[:root_path] ? send(options[:root_path], locale: loc) : params.merge(locale: loc)
      links[loc] = {name: t("languages.#{loc}", default: loc), link: url_for(locale_param)} if options[:without_locales].exclude?(loc)
    end

    if block_given?
      links.each do |loc, link|
        yield(loc, link[:name], link[:link])
      end
    end

    content_tag(options[:wrapper_tag], class: options[:wrapper_class]) do
      links.each do |loc, link|
        class_attr = (I18n.locale == loc ? options[:active_class] : nil)
        concat content_tag(options[:item_tag], (I18n.locale == loc) ? link[:name] : (link_to link[:name], link[:link]), class: class_attr)
      end
    end
  end

end
