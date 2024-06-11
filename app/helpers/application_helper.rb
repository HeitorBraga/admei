# frozen_string_literal: true

require 'will_paginate_bulma'

module ApplicationHelper
  def will_paginate(collection = nil, options = {})
    options = options.merge(renderer: WillPaginateBulma)

    super(collection, options)
  end

  def page_title
    @title || I18n.t("resources.controllers#{module_name.blank? ? '' : ".#{module_name.camelize}"}.#{controller_name.camelize}")
  end

  def module_name
    @module_name ||= ''
  end

  def bool(value)
    if value
      '<i class="fas fa-check-circle"></i>'.html_safe
    else
      '<i class="fas fa-times-circle"></i>'.html_safe
    end
  end

  def controller_asset_file
    namespace = controller.class.to_s.include?('::') ? controller.class.to_s.split('::')[0].downcase : nil
    "#{namespace.blank? ? '' : "#{namespace}/"}#{controller_name}"
  end

  def asset_exists?(asset_file, asset_type)
    if asset_type == 'js'
      Pluto::Application.assets.find_asset("#{asset_file}.js")
    else
      Pluto::Application.assets.find_asset("#{asset_file}.css") ||
      Pluto::Application.assets.find_asset("#{asset_file}.scss")
    end
  end

  def number_to_float(number, precision: 2)
    number_to_currency(number, separator: ',', unit: '', precision: precision, delimiter: '.')
  end

  def tenant_id(id)
    [Apartment::Tenant.current, id].join('_')
  end
end
