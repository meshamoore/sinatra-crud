users = [
  {fname: 'Justin', lname: 'Tallant', email: 'justin@example.com'},
  {fname: 'Jane', lname: 'Doe', email: 'jane@example.com'},
  {fname: 'Jon', lname: 'Doe', email: 'jon@example.com'},
  {fname: 'Bob', lname: 'Smith', email: 'bob@example.com'}
]

users.each do |u|
  User.create(u)
end

movies = [
	{title: 'Happy Gilmore', year: '1996', rating: '7.0'},
	{title: 'Billy Madison', year: '1995', rating: '6.4'},
	{title: '50 First Dates', year: '2004', rating: '6.8'},
	{title: 'The Wedding Singer', year: '1998', rating: '6.8'}
]

movies.each do |m|
	Movie.create(m)
end