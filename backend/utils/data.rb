require 'json'
require_relative '../models/car'

module GetAround

  def self.compute_rental_fares(rental_clazz)
    data_json = GetAround.file_to_json('input.json')

    cars = data_json[:cars].map { |car_attrs|
      Car.new(*car_attrs.values_at(*Car.members))
    }

    _rentals = data_json[:rentals].map { |rental_attrs|
      rental     = rental_clazz.new(*rental_attrs.values_at(*rental_clazz.members))
      rental.car = cars.select { |c| c.id == rental.car_id }.first
      rental.output
    }
  end

  def self.file_to_json(filename)
    begin
      file = File.read("data/#{filename}")
      JSON.parse(file, { symbolize_names: true })
    rescue
      print "Failed to open #{filename}\n"
      exit
    end
  end

  def self.write_output(output)
    File.write('data/output.json', JSON.pretty_generate({ rentals: output }))
  end

  def self.problem_solved?
    file_to_json('expected_output.json') == file_to_json('output.json')
  end

  def self.problem_solved_message
    problem_solved? ? "output file matches the expected one" : "You may have some issue in your output file"
  end

end