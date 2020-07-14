@user = User.create!(name: "Chase", city: 'Denver', state: "Colorado", email: 'lethargicgarfield@gmail.com', password: "password_mania")
@post1 = @user.posts.create!(title: "Cutthroat on the 4th!", description: "14 in. Cutthroat on a mysis Shrimp", city: "Silverthorne", state: "CO", body_of_water: "Blue River", region: 'Central Colorado', fly_or_conventional: "Fly", privacy: "Public")
@rainbow = @post1.fish.create!(species: 'Rainbow Trout', harvested: false, length: 15, quantity: 1, photo: 'rainbow_blue_river.jpg')
@post2 = @user.posts.create!(title: "Dream Stream Cuttbow", description: "Cuttbow Wd-40 action", city: "Fairplay", state: "CO", body_of_water: "Dream Stream", region: 'South Park', fly_or_conventional: "Fly", privacy: "Private")
@cuttbow = @post2.fish.create!(species: 'Hybrid Trout', harvested: false, length: 18, quantity: 1, photo: 'cuttbow.jpg')
