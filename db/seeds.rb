# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  [
    {
      name: "田中",
      email: "tanaka@tanaka.com",
      password: "123456"
    },
    {
      name: "佐藤",
      email: "satou@satou.com",
      password: "123456"
    }
  ]
)

# Member.create!(
#   [
#     {
#       name: "あゆみ",
#       email: "ayumi@ayumi.com",
#       password: "123456",
#       prpfile_image: File.open('./app/assets/images/test.jpg'),
#       introduction: "",
#       is_deleted: "false"
#     }
#   ]
# )
  
Genre.create!(
  [
    {
      name: "ケーキ"
    },
    {
      name: "マカロン"
    },
    {
      name: "チョコレート"
    },
    {
      name: "パフェ"
    },
    {
      name: "カフェ"
    },
    {
      name: "かき氷"
    }
  ]
)