class Setting < ApplicationRecord
  validates_presence_of :name, :value, :data_type
  validates_uniqueness_of :name

  INVENTORY_MAIN = 'inventory.main'.freeze
  POS_HALL_MODE = 'pos.hall.mode'.freeze
  MULTI_FLAVOUR_PRICE_POLICY = 'pos.multy_flavour_price_policy'.freeze
  ADD_PRODUCT_TO_ORDER_BEHAVIOR = 'pos.add_product_to_order_behavior'.freeze

  SETTINGS = [
    # {
    #   name: INVENTORY_MAIN,
    #   data_type: Integer,
    #   default: 1,
    #   list: Inventory,
    #   scope: :tenant,
    # },
    # {
    #   name: POS_HALL_MODE,
    #   data_type: String,
    #   default: 'table',
    #   list: [['Por numero da mesa', 'table_number'], ['Por comanda', 'check_pad']],
    #   scope: :tenant,
    # },
    # {
    #   name: MULTI_FLAVOUR_PRICE_POLICY,
    #   data_type: String,
    #   default: 'average',
    #   list: [
    #     ['cobrar pela média dos sabores', 'average'],
    #     ['cobrar pelo sabor mais caro', 'most_expensive'],
    #   ],
    #   scope: :tenant,
    # },
    # {
    #   name: ADD_PRODUCT_TO_ORDER_BEHAVIOR,
    #   data_type: String,
    #   default: 'add',
    #   list: [
    #     ['Adicionar ao item existente caso já esteja no pedido', 'add'],
    #     ['Sempre adicionar um novo item, mesmo que exista outro igual', 'append'],
    #   ],
    #   scope: :tenant,
    # },
  ].freeze

  class Boolean
    def self.to_s
      'Boolean'
    end
  end

  class Text
    def self.to_s
      'Text'
    end
  end

  def self.get(name)
    Setting.find_or_create_by(name: name)
  end

  def self.[](name)
    get(name).value_or_default
  end

  def self.set(name, value)
    setting = Setting.find_or_create_by(name: name)
    setting.data_type ||= setting.meta[:data_type].to_s
    setting.value = value.to_s
    setting.company = Current.company if setting.company_scope?

    setting.save
  end

  def self.available_settings(scope: :tenant)
    SETTINGS.select { |setting| setting[:scope] == scope }
  end

  def self.get_options_for_list(param)
    if param[:list]
      model_to_list = param[:list]
      if model_to_list.instance_of?(Array)
        param[:list]
      else
        if !param[:scope] == :company && model_to_list.new.respond_to?(:company_id)
          model_to_list.where(company: Current.company).map { |item| [item.name, item.id] }
        else
          model_to_list.all.map { |item| [item.name, item.id] }
        end
      end
    end
  end

  def tenant_scope?
    meta[:scope] == :tenant
  end

  def company_scope?
    meta[:scope] == :company
  end

  def value_or_default
    cast_value || meta[:default]
  end

  def meta
    @meta ||= begin
      meta = SETTINGS.select { |item| item[:name] == name.to_s }.first || {}

      raise NameError, 'Invalid setting name' unless meta

      meta
    end
  end

  private

  def cast_value
    case data_type
    when Float.to_s
      value.real
    when Integer.to_s
      value.to_i
    when Boolean.to_s
      (value =~ /(true|t|yes|y|1)$/i) >= 0
    else
      value
    end
  end
end
