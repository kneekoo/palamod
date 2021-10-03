local S = minetest.get_translator(minetest.get_current_modname())

--[[
TODO:reenable griefing of protected areas then possible (grief_protected = true)
]]

pala_dynamite.register_dynamite("pala_dynamite:dynamite", {
	description = S("Dynamite"),
	inventory_image = "pala_dynamite_dynamite_inv.png",
	texture = "pala_dynamite_dynamite_texture.png",
	on_explode = function(pos, name)
		mcl_explosions.explode(pos, 3, {}, minetest.get_player_by_name(name))
	end,
})

pala_dynamite.register_dynamite("pala_dynamite:dynamite_big", {
	description = S("Big Dynamite"),
	inventory_image = "pala_dynamite_big_dynamite_inv.png",
	texture = "pala_dynamite_dynamite_texture.png",
	on_explode = function(pos, name)
		mcl_explosions.explode(pos, 5, {}, minetest.get_player_by_name(name))
	end,
})

pala_dynamite.register_dynamite("pala_dynamite:dynamite_endium", {
	description = S("Endium Dynamite"),
	inventory_image = "pala_dynamite_endium_dynamite_inv.png",
	texture = "pala_dynamite_endium_dynamite_texture.png",
	on_explode = function(pos, name)
		mcl_explosions.explode(pos, 10, {max_blast_resistance = 10}, minetest.get_player_by_name(name))
	end,
})

pala_dynamite.register_dynamite("pala_dynamite:dynamite_ninja", {
	description = S("Ninja Dynamite"),
	inventory_image = "pala_dynamite_ninja_dynamite_inv.png",
	texture = "pala_dynamite_ninja_dynamite_texture.png",
	on_explode = function(pos, name)
		mcl_explosions.explode(pos, 5, {sound = false, particles = false}, minetest.get_player_by_name(name))
	end,
})

if minetest.get_modpath("mcl_tnt") and minetest.get_modpath("pala_looting") then
	minetest.register_craft({
		output = "pala_dynamite:dynamite",
		recipe = {
			{"pala_looting:diamondstring", "", ""},
			{"mcl_tnt:tnt", "", ""},
			{"mcl_tnt:tnt", "", ""},
		},
	})
end

minetest.register_craft({
	output = "pala_dynamite:dynamite_big",
	recipe = {
		{"pala_dynamite:dynamite", "pala_dynamite:dynamite", "pala_dynamite:dynamite"},
		{"", "", ""},
		{"", "", ""},
	},
})

if minetest.get_modpath("pala_paladium") then
	minetest.register_craft({
		output = "pala_dynamite:dynamite_endium 3",
		type = "shapeless",
		recipe = {"pala_dynamite:dynamite", "pala_paladium:endium_nugget"},
	})
end
