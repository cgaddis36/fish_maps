@user = User.create!(name: 'Chase',
                     city: 'Denver',
                     state: 'Colorado',
                     email: 'lethargicgarfield@gmail.com',
                     password: 'password_mania')

@post1 = @user.posts.create!(title: 'Cutthroat on the 4th!',
                             city: 'Silverthorne',
                             state: 'CO',
                             body_of_water: 'Blue River',
                             region: 'Central Colorado',
                             fly_or_conventional: 'Fly',
                             privacy: 'Public')

@rainbow = @post1.fish.create!(species: 'Rainbow Trout',
                               harvested: false,
                               length: 15,
                               quantity: 1, photo: 'rainbow_blue_river.jpg')

@post2 = @user.posts.create!(title: 'Dream Stream Cuttbow',
                             city: 'Fairplay',
                             state: 'CO',
                             fly_or_conventional: 'Fly',
                             body_of_water: 'Dream Stream',
                             region: 'South Park', privacy: 'Public')

@cuttbow = @post2.fish.create!(species: 'Hybrid Trout',
                               harvested: false,
                               length: 18,
                               quantity: 1,
                               photo: 'cuttbow.jpg')
