local plugin_label = "REJI_AUTO_ELIXIR"
local menu = {}

local low_elixir_options = {
  "Precision",
  "Advantage",
  "Destruction",
  "Resource",
  "Fortitude",
  "Iron Barbs",
  "Shadow Resist",
  "Poison Resist",
  "Lightning Resist",
  "Fire Resist",
  "Cold Resist",
}

local high_elixir_options = {
  "Precision II",
  "Advantage II",
  "Destruction II",
  "Resource II",
  "Fortitude II",
  "Iron Barbs II",
  "Shadow Resist II",
  "Poison Resist II",
  "Lightning Resist II",
  "Fire Resist II",
  "Cold Resist II",
}

menu.elements = {
  main_tree = tree_node:new(0),
  main_toggle = checkbox:new(false, get_hash(plugin_label .. "_main_toggle")),

  low_elixir_combo = combo_box:new(0, get_hash(plugin_label .. "_low_elixir_combo")),
  low_elixir_toggle = checkbox:new(false, get_hash(plugin_label .. "_low_elixir_toggle")),
  
  high_elixir_combo = combo_box:new(0, get_hash(plugin_label .. "_high_elixir_combo")),
  high_elixir_toggle = checkbox:new(false, get_hash(plugin_label .. "_high_elixir_toggle")),
}

function menu.render()
  if not menu.elements.main_tree:push("Auto Elixir (Reji)") then
    return
  end

  menu.elements.main_toggle:render("Enable", "Toggles Potion Buff on/off")
  if not menu.elements.main_toggle:get() then
    menu.elements.main_tree:pop()
    return
  end

  menu.elements.low_elixir_combo:render("Low Elixirs", low_elixir_options, "Which elixir do you want to use?")
  menu.elements.low_elixir_toggle:render("Low Elixir Toggle", "Toggles Low Elixir Potions on/off")
  menu.elements.high_elixir_combo:render("High Elixirs", high_elixir_options, "Which elixir do you want to use?")
  menu.elements.high_elixir_toggle:render("High Elixir Toggle", "Toggles High Elixir Potions on/off")

  menu.elements.main_tree:pop()
end

return menu