local menu = require("menu")

function check_for_player_buff(buffs, option)
  local count = 0
  for _, buff in ipairs(buffs) do
    if buff:name() == option then
      count = count + 1
    end
  end
  return count
end

function check_inventory(elixir_options, chosen_index, elixir_toggle, buffs, consumable_items)
  if elixir_toggle then
    if check_for_player_buff(buffs, elixir_options[chosen_index + 1]) < 1 then
      if #consumable_items > 0 then
        for _, item in ipairs(consumable_items) do
          local item_name = item:get_name()
          if item_name == elixir_options[chosen_index + 1] then
            use_item(item)
            return
          end
        end
      end
    end
  end
end

local low_elixir_options = {
    "Elixir_Precision_1",
    "Elixir_SpeedAndLuck_1",
    "Elixir_Destruction_1",
    "Elixir_Resources_1",
    "Elixir_MaxLife_1",
    "Elixir_Ironbarb_1",
    "Elixir_ShadowResist_1",
    "Elixir_PoisonResist_1",
    "Elixir_LightningResist_1",
    "Elixir_FireResist_1",
    "Elixir_ColdResist_1",
}

local high_elixir_options = {
    "Elixir_Precision_5",
    "Elixir_SpeedAndLuck_2",
    "Elixir_Destruction_2",
    "Elixir_Resources_2",
    "Elixir_MaxLife_2",
    "Elixir_Ironbarb_5",
    "Elixir_ShadowResist_5",
    "Elixir_PoisonResist_5",
    "Elixir_LightningResist_5",
    "Elixir_FireResist_5",
    "Elixir_ColdResist_5",
}

on_update(function()
  local local_player = get_local_player()

  if local_player then
    local player_position = get_player_position()
    local buffs = local_player:get_buffs()
    local consumable_items = local_player:get_consumable_items()

    local closest_target = target_selector.get_target_closer(player_position, 10)
    local chosen_high_index = menu.elements.high_elixir_combo:get()
    local chosen_low_index = menu.elements.low_elixir_combo:get()

    local high_elixir_toggle = menu.elements.high_elixir_toggle:get()
    local low_elixir_toggle = menu.elements.low_elixir_toggle:get()

    if closest_target then
      check_inventory(high_elixir_options, chosen_high_index, high_elixir_toggle, buffs, consumable_items)
      check_inventory(low_elixir_options, chosen_low_index, low_elixir_toggle, buffs, consumable_items)
    end
  end
end)

on_render_menu(menu.render)
