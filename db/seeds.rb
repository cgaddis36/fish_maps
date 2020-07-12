@user = User.create!(name: "Chase")
@post1 = @user.posts.create!(title: "Rainbows on the 4th!", description: "15 in. Rainbow on a mysis Shrimp", city: "Silverthorne", state: "CO", body_of_water: "Blue River", region: 'Summit Co', photo: 'rainbow_blue_river.jpg')
@rainbow = @post1.fish.create!(species: 'Rainbow Trout', harvested: false, length: 15, quantity: 1, photo: 'rainbow_blue_river.jpg')
