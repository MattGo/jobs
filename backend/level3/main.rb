#!/usr/bin/env ruby

require '../utils/data'
require '../models/level_3/rental'

###################################
#  Execute the level 2 challenge  #
###################################

GetAround.write_output(GetAround.compute_rental_fares(Level3::Rental))
puts GetAround.problem_solved_message