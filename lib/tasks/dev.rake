namespace :dev do

  task :fake => :environment do
    User.delete_all
    Message.delete_all
    Comment.delete_all
    Like.delete_all
    Subscribe.delete_all


    users = []
    10.times do
      users << User.create!( :email => Faker::Internet.email,
                             :password => "12345678")
    end

    20.times do
      m = Message.create!( :title => Faker::Lorem.word,
                           :status => ["pending", "completed"].sample,
                           :content => Faker::Lorem.paragraph,
                           :user => users.sample,
                           :created_at => Time.now - rand(30).days )
      5.times do
        m.comments.create!( :content => Faker::Lorem.paragraph,
                            :user => users.sample )
      end
      2.times do 
        m.likes.create!(:user => users.sample)
        m.subscribes.create!(:user => users.sample)
      end
    end
  end

end