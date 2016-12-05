require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'film.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
  t = Film.new
  t.title = row['Title']
  t.year = row['Year']
  t.save
end