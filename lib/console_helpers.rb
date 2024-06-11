module ConsoleHelpers
  def demo!
    t_switch!('demo')
  end

  def demo!
    t_switch!('demo')
  end

  def t_switch!(tenant_name)
    Apartment::Tenant.switch!(tenant_name)
    "Just switched to: #{Apartment::Tenant.current.upcase}"
  end
end
