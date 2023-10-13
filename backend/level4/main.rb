#!/usr/bin/env ruby

require '../utils/data'
require '../models/level_4/rental'

###################################
#  Execute the level 2 challenge  #
###################################

GetAround.write_output(GetAround.compute_rental_fares(Level4::Rental))
puts GetAround.problem_solved_message