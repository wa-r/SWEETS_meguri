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

Member.create!(
  [
    {
      name: "あゆみ",
      email: "ayumi@ayumi.com",
      password: "123456",
      prpfile_image: File.open('./app/assets/images/prpfile1.jpg'),
      introduction: "スイーツ大好きです！よろしくお願いします！",
      is_deleted: "false"
    },
    {
      name: "さき",
      email: "saki@saki.com",
      password: "123456",
      prpfile_image: File.open('./app/assets/images/prpfile2.jpg'),
      introduction: "毎週ケーキ屋巡りしています！",
      is_deleted: "false"
    },
    {
      name: "まいこ",
      email: "maiko@maiko.com",
      password: "123456",
      prpfile_image: File.open('./app/assets/images/prpfile3.jpg'),
      introduction: "カフェのでのんびりすることが趣味です。",
      is_deleted: "false"
    },
    {
      name: "はな",
      email: "hana@hana.com",
      password: "123456",
      prpfile_image: File.open('./app/assets/images/prpfile4.jpg'),
      introduction: "美味しいお店の情報が知りたいです！",
      is_deleted: "false"
    },
  ]
)

Tweet.create!(
  [
    {
      member_id: 1,
      title: "隣町のケーキ屋！",
      content:
      "おしゃれで可愛いケーキがいっぱい。
      ついつい沢山買ってしまいました！",
      image: File.open('./app/assets/images/tiramisu.jpg'),
    },
    {
      member_id: 1,
      title: "隣町のケーキ屋！",
      content:
      "おしゃれで可愛いケーキがいっぱい。
      ついつい沢山買ってしまいました！",
      image: File.open('./app/assets/images/berry-cake.jpg'),
    },
    {
      member_id: 1,
      title: "隣町のケーキ屋！",
      content:
      "おしゃれで可愛いケーキがいっぱい。
      ついつい沢山買ってしまいました！",
      image: File.open('./app/assets/images/genre-cafe.jpg'),
    },
    {
      member_id: 1,
      title: "隣町のケーキ屋！",
      content:
      "おしゃれで可愛いケーキがいっぱい。
      ついつい沢山買ってしまいました！",
      image: File.open('./app/assets/images/tiramisu.jpg'),
    },
    {
      member_id: 1,
      title: "隣町のケーキ屋！",
      content:
      "おしゃれで可愛いケーキがいっぱい。
      ついつい沢山買ってしまいました！",
      image: File.open('./app/assets/images/berry-cake.jpg'),
    },
    {
      member_id: 1,
      title: "隣町のケーキ屋！",
      content:
      "おしゃれで可愛いケーキがいっぱい。
      ついつい沢山買ってしまいました！",
      image: File.open('./app/assets/images/genre-cafe.jpg'),
    },
    {
      member_id: 1,
      title: "隣町のケーキ屋！",
      content:
      "おしゃれで可愛いケーキがいっぱい。
      ついつい沢山買ってしまいました！",
      image: File.open('./app/assets/images/tiramisu.jpg'),
    },
    {
      member_id: 1,
      title: "隣町のケーキ屋！",
      content:
      "おしゃれで可愛いケーキがいっぱい。
      ついつい沢山買ってしまいました！",
      image: File.open('./app/assets/images/berry-cake.jpg'),
    },
    {
      member_id: 1,
      title: "隣町のケーキ屋！",
      content:
      "おしゃれで可愛いケーキがいっぱい。
      ついつい沢山買ってしまいました！",
      image: File.open('./app/assets/images/genre-cafe.jpg'),
    },
    {
      member_id: 1,
      title: "隣町のケーキ屋！",
      content:
      "おしゃれで可愛いケーキがいっぱい。
      ついつい沢山買ってしまいました！",
      image: File.open('./app/assets/images/tiramisu.jpg'),
    },
    {
      member_id: 1,
      title: "隣町のケーキ屋！",
      content:
      "おしゃれで可愛いケーキがいっぱい。
      ついつい沢山買ってしまいました！",
      image: File.open('./app/assets/images/berry-cake.jpg'),
    },
    {
      member_id: 1,
      title: "隣町のケーキ屋！",
      content:
      "おしゃれで可愛いケーキがいっぱい。
      ついつい沢山買ってしまいました！",
      image: File.open('./app/assets/images/genre-cafe.jpg'),
    },
  ]
)
  
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

Shop.create!(
  [
    {
      genre_id: 1,
      name: "patisserie meguri",
      phone_number: "03-1234-5678",
      address: "東京都渋谷区渋谷1-1-1",
      nearest_station: "JR渋谷駅 徒歩7分",
      business_hours: "10:00〜19:00",
      regular_holiday: "毎週水曜日",
      caption:
      "昨年オープンしたばかりのお店です。
      常時生菓子が30種類、焼き菓子が20種類ほどご用意しております。
      喫茶コーナーも併設されていますので、ケーキとコーヒーを召し上がりながら、ごゆっくりしていただけます。",
      main_image_id: File.open('./app/assets/images/showcase.jpg'),
    },
    {
      genre_id: 1,
      name: "patisserie tuki",
      phone_number: "03-1234-5678",
      address: "東京都新宿区新宿1-1-1",
      nearest_station: "JR新宿駅 徒歩10分",
      business_hours: "10:00〜20:00",
      regular_holiday: "毎週木曜日",
      caption:
      "昨年オープンしたばかりのお店です。
      常時生菓子が30種類、焼き菓子が20種類ほどご用意しております。
      喫茶コーナーも併設されていますので、ケーキとコーヒーを召し上がりながら、ごゆっくりしていただけます。",
      main_image_id: File.open('./app/assets/images/showcase2.jpg'),
    },
    {
      genre_id: 1,
      name: "にこにこケーキ",
      phone_number: "03-1234-5678",
      address: "東京都港区六本木1-1-1",
      nearest_station: "地下鉄日比谷線六本木駅 徒歩10分",
      business_hours: "11:00〜20:00",
      regular_holiday: "毎週金曜日",
      caption:
      "昨年オープンしたばかりのお店です。
      常時生菓子が30種類、焼き菓子が20種類ほどご用意しております。
      喫茶コーナーも併設されていますので、ケーキとコーヒーを召し上がりながら、ごゆっくりしていただけます。",
      main_image_id: File.open('./app/assets/images/showcase3.jpg'),
    },
    {
      genre_id: 2,
      name: "coroncoron",
      phone_number: "03-1234-5678",
      address: "東京都渋谷区渋谷1-1-1",
      nearest_station: "JR渋谷駅 徒歩7分",
      business_hours: "10:00〜19:00",
      regular_holiday: "毎週水曜日",
      caption:
      "マカロンの専門店です。
      プレゼントとしても大人気です！
      是非お立ち寄りください。",
      main_image_id: File.open('./app/assets/images/macaron-shop.jpg'),
    },
    {
      genre_id: 2,
      name: "patisserie tuki",
      phone_number: "03-1234-5678",
      address: "東京都新宿区新宿1-1-1",
      nearest_station: "JR新宿駅 徒歩10分",
      business_hours: "10:00〜20:00",
      regular_holiday: "毎週木曜日",
      caption:
      "マカロンの専門店です。
      プレゼントとしても大人気です！
      是非お立ち寄りください。",
      main_image_id: File.open('./app/assets/images/macaron-shop1.jpg'),
    },
    {
      genre_id: 2,
      name: "にこにこケーキ",
      phone_number: "03-1234-5678",
      address: "東京都港区六本木1-1-1",
      nearest_station: "地下鉄日比谷線六本木駅 徒歩10分",
      business_hours: "11:00〜20:00",
      regular_holiday: "毎週金曜日",
      caption:
      "マカロンの専門店です。
      プレゼントとしても大人気です！
      是非お立ち寄りください。",
      main_image_id: File.open('./app/assets/images/macaron-shop2.jpg'),
    },
    {
      genre_id: 3,
      name: "CoronCoron",
      phone_number: "03-1234-5678",
      address: "東京都渋谷区渋谷1-1-1",
      nearest_station: "JR渋谷駅 徒歩7分",
      business_hours: "10:00〜19:00",
      regular_holiday: "毎週水曜日",
      caption:
      "チョコレートの専門店です。
　　　お酒を使用したボンボンショコラやお子様でも召し上がれるチョコレートもご用意しております。
　　　是非一度お立ち寄りください。",
      main_image_id: File.open('./app/assets/images/choco-shop.jpg'),
    },
    {
      genre_id: 3,
      name: "マカロン専門店",
      phone_number: "03-1234-5678",
      address: "東京都新宿区新宿1-1-1",
      nearest_station: "JR新宿駅 徒歩10分",
      business_hours: "10:00〜20:00",
      regular_holiday: "毎週木曜日",
      caption:
      "チョコレートの専門店です。
　　　お酒を使用したボンボンショコラやお子様でも召し上がれるチョコレートもご用意しております。
　　　是非一度お立ち寄りください。",
      main_image_id: File.open('./app/assets/images/choco-shop1.jpg'),
    },
    {
      genre_id: 3,
      name: "colorful",
      phone_number: "03-1234-5678",
      address: "東京都港区六本木1-1-1",
      nearest_station: "地下鉄日比谷線六本木駅 徒歩10分",
      business_hours: "11:00〜20:00",
      regular_holiday: "毎週金曜日",
      caption:
      "チョコレートの専門店です。
　　　お酒を使用したボンボンショコラやお子様でも召し上がれるチョコレートもご用意しております。
　　　是非一度お立ち寄りください。",
      main_image_id: File.open('./app/assets/images/choco-shop2.jpg'),
    },
    {
      genre_id: 4,
      name: "parfait hikari",
      phone_number: "03-1234-5678",
      address: "東京都渋谷区渋谷1-1-1",
      nearest_station: "JR渋谷駅 徒歩7分",
      business_hours: "10:00〜19:00",
      regular_holiday: "毎週水曜日",
      caption:
      "パフェの専門店です。
      旬の種ルーツを使用したパフェが大人気です！
      是非お立ち寄りください。",
      main_image_id: File.open('./app/assets/images/parfait.jpg'),
    },
    {
      genre_id: 4,
      name: "patisserie tu",
      phone_number: "03-1234-5678",
      address: "東京都新宿区新宿1-1-1",
      nearest_station: "JR新宿駅 徒歩10分",
      business_hours: "10:00〜20:00",
      regular_holiday: "毎週木曜日",
      caption:
      "パフェの専門店です。
      旬の種ルーツを使用したパフェが大人気です！
      是非お立ち寄りください。",
      main_image_id: File.open('./app/assets/images/cparfait1.jpg'),
    },
    {
      genre_id: 4,
      name: "にこにこケーキ",
      phone_number: "03-1234-5678",
      address: "東京都港区六本木1-1-1",
      nearest_station: "地下鉄日比谷線六本木駅 徒歩10分",
      business_hours: "11:00〜20:00",
      regular_holiday: "毎週金曜日",
      caption:
      "パフェの専門店です。
      旬の種ルーツを使用したパフェが大人気です！
      是非お立ち寄りください。",
      main_image_id: File.open('./app/assets/images/parfait2.jpg'),
    },
    {
      genre_id: 5,
      name: "coffee",
      phone_number: "03-1234-5678",
      address: "東京都渋谷区渋谷1-1-1",
      nearest_station: "JR渋谷駅 徒歩7分",
      business_hours: "10:00〜19:00",
      regular_holiday: "毎週水曜日",
      caption:
      "厳選したコーヒー豆を使用しております。
      香ばしいコーヒーの香りと共に休憩されていかれませんか。",
      main_image_id: File.open('./app/assets/images/cafe.jpg'),
    },
    {
      genre_id: 5,
      name: "ゆるりカフェ",
      phone_number: "03-1234-5678",
      address: "東京都新宿区新宿1-1-1",
      nearest_station: "JR新宿駅 徒歩10分",
      business_hours: "10:00〜20:00",
      regular_holiday: "毎週木曜日",
      caption:
      "厳選したコーヒー豆を使用しております。
      香ばしいコーヒーの香りと共に休憩されていかれませんか。",
      main_image_id: File.open('./app/assets/images/cafe1.jpg'),
    },
    {
      genre_id: 5,
      name: "Casa Francesa",
      phone_number: "03-1234-5678",
      address: "東京都港区六本木1-1-1",
      nearest_station: "地下鉄日比谷線六本木駅 徒歩10分",
      business_hours: "11:00〜20:00",
      regular_holiday: "毎週金曜日",
      caption:
      "厳選したコーヒー豆を使用しております。
      香ばしいコーヒーの香りと共に休憩されていかれませんか。",
      main_image_id: File.open('./app/assets/images/cafe2.jpg'),
    },
    {
      genre_id: 6,
      name: "ふわふわ氷",
      phone_number: "03-1234-5678",
      address: "東京都渋谷区渋谷1-1-1",
      nearest_station: "JR渋谷駅 徒歩7分",
      business_hours: "10:00〜19:00",
      regular_holiday: "毎週水曜日",
      caption:
      "アルプスの水を使用した天然氷を使用しています！
      ふわふわで頭がキーンとなりにくいです。
      暑い夏にぴったりのかき氷、是非召し上がってください。",
      main_image_id: File.open('./app/assets/images/ice.jpg'),
    },
    {
      genre_id: 6,
      name: "桜",
      phone_number: "03-1234-5678",
      address: "東京都新宿区新宿1-1-1",
      nearest_station: "JR新宿駅 徒歩10分",
      business_hours: "10:00〜20:00",
      regular_holiday: "毎週木曜日",
      caption:
      "アルプスの水を使用した天然氷を使用しています！
      ふわふわで頭がキーンとなりにくいです。
      暑い夏にぴったりのかき氷、是非召し上がってください。",
      main_image_id: File.open('./app/assets/images/ice1.jpg'),
    },
    {
      genre_id: 6,
      name: "こまちゃん屋",
      phone_number: "03-1234-5678",
      address: "東京都港区六本木1-1-1",
      nearest_station: "地下鉄日比谷線六本木駅 徒歩10分",
      business_hours: "11:00〜20:00",
      regular_holiday: "毎週金曜日",
      caption:
      "アルプスの水を使用した天然氷を使用しています！
      ふわふわで頭がキーンとなりにくいです。
      暑い夏にぴったりのかき氷、是非召し上がってください。",
      main_image_id: File.open('./app/assets/images/ice2.jpg'),
    }
  ]
)
