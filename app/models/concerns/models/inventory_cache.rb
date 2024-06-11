module Models::InventoryCache
  extend ActiveSupport::Concern

  included do
    after_touch :update_inventory_cache
  end

  private

  def update_inventory_cache
    update(
      blocked_qty: calculate_blocked_qty,
      in_transit_qty: calculate_in_transit_qty,
      qty: calculate_qty,
    )
  end

  def calculate_blocked_qty
    @calculated_blocked_qty ||= transactions.sum(:delta_qty_committed)
  end

  def calculate_in_transit_qty
    @calculated_in_transit_qty ||= transactions.sum(:delta_qty_in_transit)
  end

  def calculate_qty
    @calculated_qty ||= transactions.sum(:delta_qty) - calculate_blocked_qty - calculate_in_transit_qty
  end
end
