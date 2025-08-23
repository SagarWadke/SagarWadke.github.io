require 'csv'

module Jekyll
  class CsvToJsonConverter < Generator
    safe true
    priority :highest

    def generate(site)
      csv_path = File.join(site.source, '_data', 'movies.csv')
      return unless File.exist?(csv_path)

      movies = []
      CSV.foreach(csv_path, headers: true) do |row|
        movies << {
          'title' => row['Title'],
          'year' => row['Year'].to_i,
          'genre' => row['Genre'].split(','),
          'difficulty' => row['Difficulty']
        }
      end

      # Create a JavaScript file with the movies data
      js_content = "const movies = #{movies.to_json};"
      
      # Write to assets/js/movies-data.js
      js_path = File.join(site.source, 'assets', 'js', 'movies-data.js')
      FileUtils.mkdir_p(File.dirname(js_path))
      File.write(js_path, js_content)
    end
  end
end