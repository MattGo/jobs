require 'json'

module GetAround
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