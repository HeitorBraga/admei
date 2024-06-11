module AddressHelper
  def states
    State.all.map {|state| [state.name, state.id, { uf: state.uf }]}
  end
end