//Найдите средний возраст из коллекции ich.US_Adult_Income

db.US_Adult_Income.aggregate([
  {
    $group: {
      _id: null,
      averageAge: { $avg: '$age' }
    }
  }
])


//Поменяв подключение к базе данных, создать коллекцию orders_NAME (для уникальности - добавим ваше имя в название) со свойствами id, customer, product, amount, city, используя следующие данные:

db.orders_Dennis.insertMany([
  { id: 1,
    customer: "Olga",
    product: "Apple",
    amount: 15.55,
    city: "Berlin" },
  { id: 2,
    customer: "Anna",
    product: "Apple",
    amount: 10.05,
    city: "Madrid" },
  { id: 3,
    customer: "Olga",
    product: "Kiwi",
    amount: 9.6,
    city: "Berlin" },
  { id: 4,
    customer: "Anton",
    product: "Apple",
    amount: 20,
    city: "Roma" },
  { id: 5,
    customer: "Olga",
    product: "Banana",
    amount: 8, 
    city: "Madrid" },
  { id: 6,
    customer: "Petr",
    product: "Orange",
    amount: 18.3,
    city: "Paris" }
])


//Найти сколько всего было совершено покупок

db.orders_Dennis.aggregate([
  {
    $count: "totalPurchases"
  }
])

//Найти сколько всего раз были куплены яблоки

db.orders_Dennis.countDocuments({ product: "Apple" })

//Вывести идентификаторы трех самые дорогих покупок

db.orders_Dennis.find({}, { _id: 0, id: 1, amount: 1 })
  .sort({ amount: -1 })
  .limit(3)

  //Найти сколько всего покупок было совершено в Берлине

  db.orders_Dennis.countDocuments({ city: "Berlin" })


  //Найти количество покупок яблок в городах Берлин и Мадрид

  db.orders_Dennis.aggregate([
  {
    $match: {
      product: "Apple",
      city: { $in: ["Berlin", "Madrid"] }
    }
  },
  {
    $group: {
      _id: "$city",
      applePurchases: { $sum: 1 }
    }
  }
])


//Найти сколько было потрачено каждым покупателем

db.orders_Dennis.aggregate([
  {
    $group: {
      _id: "$customer",
      totalSpent: { $sum: "$amount" }
    }
  }
])


//Найти в каких городах совершала покупки Ольга

db.orders_Dennis.aggregate([
  { $match: { customer: "Olga" } },
  { $group: { _id: "$city" } }
])

