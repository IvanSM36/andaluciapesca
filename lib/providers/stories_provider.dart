import 'package:andaluciapesca/models/stories_model.dart';

class StoriesProvider {
  List<Storie> stories = [];

  List<Storie> getStories() {
    stories = [
      Storie(
        nombre: "Joanie",
        imagen:
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/404.jpg",
      ),
      Storie(
        nombre: "Kory",
        imagen:
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/167.jpg",
      ),
      Storie(
        nombre: "Hiram",
        imagen: "http://placeimg.com/640/480/food",
      ),
      Storie(
        nombre: "Heidi",
        imagen:
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/997.jpg",
      ),
      Storie(
        nombre: "Anthony",
        imagen:
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/875.jpg",
      ),
      Storie(
        nombre: "Penelope",
        imagen:
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1008.jpg",
      ),
      Storie(
        nombre: "Mack",
        imagen:
            "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/88.jpg",
      ),
    ];

    return stories;
  }
}
