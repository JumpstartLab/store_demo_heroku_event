User.create(full_name: "Franklin Webber", email: "demoXX+franklin@jumpstartlab.com", password: "password")
User.create(full_name: "Jeff", email: "demoXX+jeff@jumpstartlab.com", password: "password", display_name: "j3")
User.create(full_name: "Steve Klabnik", email: "demoXX+steve@jumpstartlab.com", password: "password", display_name: "SkrilleX", admin: true)

file = File.open('./public/images/creatures/stickers/bobby-02.png')
product1 = Product.create(title: "Bobby", description: "Marcy's triplet brother. He's kind of smelly.", price: 14.19, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/ruby-green.png')
product2 = Product.create(title: "Ruby (green)", description: "We <3 it.", price: 120.19, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/dust-bunny.png')
product3 = Product.create(title: "Dust Bunny", description: "We swear Frank didn't get his inspiration from Kirby.", price: 2.50, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/fairy.png')
product4 = Product.create(title: "The Great Fairy", description: "She'll heal you when you're low on hearts. Keep her in a bottle.", price: 23.90, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/great-slump.png')
product5 = Product.create(title: "The Great Slump", description: "The Great Slump has a single claw arm.", price: 272.30, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/madame-mushroom.png')
product6 = Product.create(title: "Madam Mushroom", description: "For best results, ingest 30 minutes before you want your vision quest to begin.", price: 104.19, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/marcy-02.png')
product7 = Product.create(title: "Macy", description: "Macy, Marcy's triplet sister, is a tom-boy at heart.", price: 104.19, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/marcy.png')
product8 = Product.create(title: "Marcy", description: "The one and only (except for her siblings).", price: 104.19, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/ruby-blue.png')
product9 = Product.create(title: "Ruby (blue)", description: "We <3 it.", price: 104.19, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/madame-mushroom-yellow.png')
product10 = Product.create(title: "Madam Mushroom (yellow)", description: "For best results, ingest 30 minutes before you want your vision quest to begin.", price: 104.19, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/senor-marshmellow.png')
product11 = Product.create(title: "Senior Marshmellow", description: "Unfortunately he never learned how to spell his name correctly.", price: 74.44, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/slump-sr.png')
product12 = Product.create(title: "Slump, Sr.", description: "The grandfather of all hairballs. He was in a war once, you know.", price: 34.07, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/slumpy.png')
product13 = Product.create(title: "Slumpy", description: "The daddy of the bunch.", price: 104.19, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/soaked-slumpy.png')
product14 = Product.create(title: "Over-Saturated Slumpy", description: "Slumpy really hates being put in the microwave.", price: 1001.87, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/madame-mushroom-purple.png')
product15 = Product.create(title: "Madam Mushroom (purple)", description: "For best results, ingest 30 minutes before you want your vision quest to begin.", price: 1235.99, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/ruby.png')
product16 = Product.create(title: "Ruby", description: "We <3 it.", price: 1.19, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/dust-bunny-purple.png')
product17 = Product.create(title: "Dust Bunny (purple)", description: "We swear Frank didn't get his inspiration from Kirby.", price: 17.95, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/squint.png')
product18 = Product.create(title: "Squint", description: "Expert piano player", price: 24.00, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/viking.png')
product19 = Product.create(title: "The Viking", description: "He's really a big softy at heart.", price: 4.70, status: 'active', image: file)
file.close
file = File.open('./public/images/creatures/stickers/wizard.png')
product20 = Product.create(title: "The Wizard", description: "Cranky, hates kids, and doesn't smell very good. I heard he's related to Dumbledore's second cousin.", price: 99.50, status: 'active', image: file)
file.close

Category.create(title: "Hairballs", product_ids: [1, 5, 7, 8, 12, 13, 14])
Category.create(title: "Mystics", product_ids: [3, 4, 6, 10, 11, 15, 17, 18, 20])
Category.create(title: "Bunnies", product_ids: [3, 17])
Category.create(title: "Brutes", product_ids: [19, 20, 11])
Category.create(title: "Miscellaneous", product_ids: [2, 9, 16, 4, 15, 18])

Sale.create(status: 'active', group: 'product', foreign_key: 1, percent_off: 50)
Sale.create(status: 'active', group: 'category', foreign_key: 3, percent_off: 25)

Rating.create(user_id: 3, product_id: 3, title: 'Awesome!', body: "Gotta love this one. It's like Kirby but with better ears!", stars: 4)
Rating.create(user_id: 2, product_id: 3, title: 'Meh...', body: 'Just a Kirby knock-off.', stars: 2)
Rating.create(user_id: 2, product_id: 1, title: 'Cool', body: "I'm happy with my purchase", stars: 3)
Rating.create(user_id: 3, product_id: 1, title: 'Bought two!', body: 'Fantastic', stars: 5)

order1 = Order.create(status: 'pending', user_id: 1)
order2 = Order.create(status: 'paid', user_id: 1)
order3 = Order.create(status: 'shipped', user_id: 1)
order4 = Order.create(status: 'cancelled', user_id: 2)
order5 = Order.create(status: 'returned', user_id: 2)
order6 = Order.create(status: 'pending', user_id: 3)
order7 = Order.create(status: 'paid', user_id: 3)
order8 = Order.create(status: 'shipped', user_id: 3)
order9 = Order.create(status: 'pending', user_id: 3)
order10 = Order.create(status: 'returned', user_id: 3)

order1.order_items.create(product_id: product1.id,
                          unit_price: product1.price,
                          selling_price: product1.current_price,
                          percent_off: product1.percent_off,
                          quantity: 2)

order1.order_items.create(product_id: product2.id,
                          unit_price: product2.price,
                          selling_price: product2.current_price,
                          percent_off: product2.percent_off,
                          quantity: 1)

order2.order_items.create(product_id: product2.id,
                          unit_price: product2.price,
                          selling_price: product2.current_price,
                          percent_off: product2.percent_off,
                          quantity: 1)

order3.order_items.create(product_id: product4.id,
                          unit_price: product4.price,
                          selling_price: product4.current_price,
                          percent_off: product4.percent_off,
                          quantity: 1)

order3.order_items.create(product_id: product5.id,
                          unit_price: product5.price,
                          selling_price: product5.current_price,
                          percent_off: product5.percent_off,
                          quantity: 1)

order4.order_items.create(product_id: product12.id,
                          unit_price: product12.price,
                          selling_price: product12.current_price,
                          percent_off: product12.percent_off,
                          quantity: 1)

order4.order_items.create(product_id: product11.id,
                          unit_price: product11.price,
                          selling_price: product11.current_price,
                          percent_off: product11.percent_off,
                          quantity: 5)

order5.order_items.create(product_id: product8.id,
                          unit_price: product8.price,
                          selling_price: product8.current_price,
                          percent_off: product8.percent_off,
                          quantity: 10)


order6.order_items.create(product_id: product15.id,
                          unit_price: product15.price,
                          selling_price: product15.current_price,
                          percent_off: product15.percent_off,
                          quantity: 1)

order7.order_items.create(product_id: product8.id,
                          unit_price: product8.price,
                          selling_price: product8.current_price,
                          percent_off: product8.percent_off,
                          quantity: 2)

order8.order_items.create(product_id: product10.id,
                          unit_price: product10.price,
                          selling_price: product10.current_price,
                          percent_off: product10.percent_off,
                          quantity: 3)

order9.order_items.create(product_id: product9.id,
                          unit_price: product9.price,
                          selling_price: product9.current_price,
                          percent_off: product9.percent_off,
                          quantity: 4)

order10.order_items.create(product_id: product18.id,
                          unit_price: product18.price,
                          selling_price: product18.current_price,
                          percent_off: product18.percent_off,
                          quantity: 1)
