# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def images(key)
  path = Rails.root.join("db", "fixtures", key)
  File.open(File.exist?(path) ? path : Rails.root.join("db", "fixtures", "default.png"))
end

HelloWorld.create(
  [
    { country: "JP", hello: "こんにちわ世界", priority: 1, image: images("jp.jpeg") },
    { country: "US", hello: "Hello World", priority: 2, image: images("us.jpeg") },
    { country: "CN", hello: "你好 世界", priority: 3, image: images("cn.jpeg") },
    { country: "DE", hello: "Hallo Welt", priority: 4, image: images("de.jpeg") },
    { country: "TR", hello: "Selam Dünya", priority: 5, image: images("tr.jpeg") },
    { country: "FR", hello: "Bonjour le monde", priority: 6, image: images("fr.jpeg") },
    { country: "KR", hello: "안녕하세요", priority: 7, image: images("kr.jpeg") },
    { country: "RU", hello: "Привет мир", priority: 8, image: images("ru.jpeg") },
    { country: "ES", hello: "Hola Mundo", priority: 9, image: images("es.jpeg") },
    { country: "IN", hello: "नमस्ते दुनिया", priority: 10, image: images("in.png") },
    { country: "PT", hello: "Olá Mundo", priority: 11, image: images("pt.jpg") },
    { country: "NL", hello: "Hallo Wereld", priority: 12, image: images("nl.jpeg") },
    { country: "CZ", hello: "Ahoj světe", priority: 13, image: images("cz.jpeg") },
    { country: "IE", hello: "Dia duit an Domhain", priority: 14, image: images("ie.jpeg") },
    { country: "GR", hello: "Γειά σου Κόσμε", priority: 15, image: images("gr.jpeg") },
    { country: "IQ", hello: "مرحبا بالعالم", priority: 16, image: images("iq.jpeg") },
    { country: "KE", hello: "Salamu, Dunia", priority: 17, image: images("ke.jpeg") },
    { country: "VN", hello: "Chào thế giới", priority: 18, image: images("vn.jpeg") },
    { country: "TH", hello: "สวัสดีชาวโลก", priority: 19, image: images("th.jpeg") },
    { country: "MY", hello: "Hai dunia", priority: 20, image: images("my.jpeg") },
  ]
)

# create root user
User.create(email: "root@hello_world.com", password: "password", password_confirmation: "password")
