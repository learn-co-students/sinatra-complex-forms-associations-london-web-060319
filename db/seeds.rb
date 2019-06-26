# Add seed data here. Seed your database with `rake db:seed`
sophie = Owner.create(name: "Sophie")
dave = Owner.create(name: "Dave")
alan = Owner.create(name: "Alan")
Pet.create(name: "Maddy", owner: sophie)
Pet.create(name: "Nona", owner: sophie)
Pet.create(name: "Bobbit", owner: dave)
Pet.create(name: "Shark", owner: alan)
Pet.create(name: "Steven Ramsey-Merriweather the third", owner: alan)