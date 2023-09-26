local reflector_spawner = require('entities/crystal-reflector/crystal-biter-reflector-spawner')
local reflector_beam = require('entities.crystal-reflector.crystal-biter-reflector-beam')

local small_reflector_biter = require('entities/crystal-reflector/small-crystal-biter-reflector')
local medium_reflector_biter = require('entities/crystal-reflector/medium-crystal-biter-reflector')
local big_reflector_biter = require('entities/crystal-reflector/big-crystal-biter-reflector')
local behemoth_reflector_biter = require('entities/crystal-reflector/behemoth-crystal-biter-reflector')

local small_capacitor_biter = require('entities/crystal-capacitor/small_crystal_biter_capacitor')



data:extend(
    {
        reflector_spawner,
        reflector_beam,
        small_reflector_biter,
        medium_reflector_biter,
        big_reflector_biter,
        behemoth_reflector_biter,

        small_capacitor_biter,
    }
)
