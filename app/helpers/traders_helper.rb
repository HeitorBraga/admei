module TradersHelper
  def available_profiles
    Trader::PROFILES.map {|item| [I18n.t("simple_form.labels.trader.profiles_list.#{item}"), item]}
  end

  def available_genders
    [['Masculino', 'M'], ['Feminino', 'F'], ['Outros', 'O']]
  end
end
