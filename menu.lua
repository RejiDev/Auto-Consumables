local plugin_label = "REJI_AUTO_CONSUMABLES"
local menu = {}
local options = require("data.consumable_options")


menu.elements = {
  main_tree = tree_node:new(0),
  main_toggle = checkbox:new(false, get_hash(plugin_label .. "_main_toggle")),

  elixir_tree = tree_node:new(1),
  incense_tree = tree_node:new(1),

  low_elixir_combo = combo_box:new(0, get_hash(plugin_label .. "_low_elixir_combo")),
  low_elixir_toggle = checkbox:new(false, get_hash(plugin_label .. "_low_elixir_toggle")),
  
  high_elixir_combo = combo_box:new(0, get_hash(plugin_label .. "_high_elixir_combo")),
  high_elixir_toggle = checkbox:new(false, get_hash(plugin_label .. "_high_elixir_toggle")),

  low_incense_combo = combo_box:new(0, get_hash(plugin_label .. "_low_incense_combo")),
  low_incense_toggle = checkbox:new(false, get_hash(plugin_label .. "_low_incense_toggle")),

  medium_incense_combo = combo_box:new(0, get_hash(plugin_label .. "_medium_incense_combo")),
  medium_incense_toggle = checkbox:new(false, get_hash(plugin_label .. "_medium_incense_toggle")),

  high_incense_combo = combo_box:new(0, get_hash(plugin_label .. "_high_incense_combo")),
  high_incense_toggle = checkbox:new(false, get_hash(plugin_label .. "_high_incense_toggle")),
}

function menu.render()
  if not menu.elements.main_tree:push("Auto Consumables (Reji)") then
    return
  end

  menu.elements.main_toggle:render("Enable", "Toggles Potion Buff on/off")
  if not menu.elements.main_toggle:get() then
    menu.elements.main_tree:pop()
    return
  end

  if menu.elements.elixir_tree:push("Elixirs") then
    menu.elements.low_elixir_combo:render("Low Elixirs", options.low_elixir_names, "Which elixir do you want to use?")
    menu.elements.low_elixir_toggle:render("Low Elixir Toggle", "Toggles Low Elixir Potions on/off")
    menu.elements.high_elixir_combo:render("High Elixirs", options.high_elixir_names, "Which elixir do you want to use?")
    menu.elements.high_elixir_toggle:render("High Elixir Toggle", "Toggles High Elixir Potions on/off")
  end

  if menu.elements.incense_tree:push("Incenses") then
    menu.elements.low_incense_combo:render("Low Incenses", options.low_incense_names, "Which low incense do you want to use?")
    menu.elements.low_incense_toggle:render("Low Incense Toggle", "Toggles Low Incenses on/off")
    menu.elements.medium_incense_combo:render("Medium Incenses", options.medium_incense_names, "Which medium incense do you want to use?")
    menu.elements.medium_incense_toggle:render("Medium Incense Toggle", "Toggles Medium Incenses on/off")
    menu.elements.high_incense_combo:render("High Incenses", options.high_incense_names, "Which high incense do you want to use?")
    menu.elements.high_incense_toggle:render("High Incense Toggle", "Toggles High Incenses on/off")
  end

  menu.elements.main_tree:pop()
end

return menu