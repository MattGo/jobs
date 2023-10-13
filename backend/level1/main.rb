#!/usr/bin/env ruby

require '../utils/data'
require '../models/rental'

###################################
#  Execute the level 2 challenge  #
###################################

GetAround.write_output(GetAround.compute_rental_fares(Rental))
puts GetAround.problem_solved_message