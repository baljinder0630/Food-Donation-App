import 'package:food_donation_app/Models/Post.model.dart';

final desc1 =
    """Food waste is a big problem all over the world, and it's not just a matter of throwing away good food. It's also a waste of money, resources, and energy. Fortunately, there are many simple things you can do to reduce food waste in your own home. Here are 10 easy tips to get you started.
Plan your meals and shop smart: One of the best ways to reduce food waste is to plan your meals in advance and only buy what you need. Make a list, check what you already have, and stick to it.
Store food properly: Proper food storage is key to preventing spoilage and extending the life of your food. Keep your fridge and pantry organized, and use airtight containers to keep food fresh.
Use your freezer: Freezing food is a great way to preserve it for later. Use your freezer to store leftovers, extra portions, and foods that are about to expire.
Learn how to cook with leftovers: Leftovers can be turned into delicious meals with a little creativity. Make soups, stews, casseroles, and salads with your leftover ingredients.
Use up your perishables first: Fruits, vegetables, and dairy products are the most perishable items in your fridge. Make sure to use them up before they go bad.""";

final List<PostModel> posts = [
  PostModel(
      id: 1,
      subject: "Waste Reduction",
      description: desc1,
      imgUrl:
          "https://th.bing.com/th/id/OIP.EIqCHlPiaz25sjy1E_Y4zgHaE8?rs=1&pid=ImgDetMain",
      createdTime: DateTime.parse("2023-09-01 20:18:04"),
      createdByAvatar:
          "https://th.bing.com/th/id/OIP.j8yd8dJ5215WbgQ0NsLzuAHaNK?w=2592&h=4608&rs=1&pid=ImgDetMain",
      userId: "1234567890",
      username: "John Doe"),
  PostModel(
      id: 2,
      subject: "Tehnology",
      description: "How Technology is Helping to Reduce Food Waste",
      imgUrl: "https://wallpaperaccess.com/full/266471.jpg",
      createdTime: DateTime.parse("2024-01-01 19:01:02"),
      createdByAvatar:
          "https://th.bing.com/th/id/OIP.leRaZskYpTKA55a0St0tZgHaJa?rs=1&pid=ImgDetMain",
      userId: "102392034923534",
      username: "Mory Jone"),
  PostModel(
      id: 1,
      subject: "Waste Reduction",
      description: desc1,
      imgUrl:
          "https://th.bing.com/th/id/OIP.EIqCHlPiaz25sjy1E_Y4zgHaE8?rs=1&pid=ImgDetMain",
      createdTime: DateTime.parse("2023-09-01 20:18:04"),
      createdByAvatar:
          "https://th.bing.com/th/id/OIP.j8yd8dJ5215WbgQ0NsLzuAHaNK?w=2592&h=4608&rs=1&pid=ImgDetMain",
      userId: "1234567890",
      username: "John Doe"),
  PostModel(
      id: 2,
      subject: "Tehnology",
      description: "How Technology is Helping to Reduce Food Waste",
      imgUrl: "https://wallpaperaccess.com/full/266471.jpg",
      createdTime: DateTime.parse("2024-01-01 19:01:02"),
      createdByAvatar:
          "https://th.bing.com/th/id/OIP.leRaZskYpTKA55a0St0tZgHaJa?rs=1&pid=ImgDetMain",
      userId: "102392034923534",
      username: "Mory Jone"),
  PostModel(
      id: 1,
      subject: "Waste Reduction",
      description: desc1,
      imgUrl:
          "https://th.bing.com/th/id/OIP.EIqCHlPiaz25sjy1E_Y4zgHaE8?rs=1&pid=ImgDetMain",
      createdTime: DateTime.parse("2023-09-01 20:18:04"),
      createdByAvatar:
          "https://th.bing.com/th/id/OIP.j8yd8dJ5215WbgQ0NsLzuAHaNK?w=2592&h=4608&rs=1&pid=ImgDetMain",
      userId: "1234567890",
      username: "John Doe"),
];
