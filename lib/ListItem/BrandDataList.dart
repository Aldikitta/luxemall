class Brand {
  final String id;
  final String name;
  final String img;
  final String desc;
  final Items item;

  const Brand({
    this.img,
    this.id,
    this.name,
    this.desc,
    this.item,
  });
}

class Items {
  final String itemName;
  final String itemPrice;
  final String itemRatting;
  final String itemSale;
  final String itemId;
  final String itemImg;

  const Items(
      {this.itemName,
      this.itemPrice,
      this.itemRatting,
      this.itemSale,
      this.itemId,
      this.itemImg});
}

List<Brand> brandData = [
  const Brand(
      name: "Bvlgari",
      id: "1",
      img: "assets/img/luxemall3.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: Items(
          itemImg: "assets/img/luxemall3.jpg",
          itemId: "1",
          itemName: "Bvlgari",
          itemPrice: "\$ 100",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
  const Brand(
      name: "Calvin Klein",
      id: "2",
      img: "assets/img/luxemall2.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: Items(
          itemImg: "assets/img/luxemall2.jpg",
          itemId: "1",
          itemName: "Calvin Klein",
          itemPrice: "\$ 1500",
          itemRatting: "4.5",
          itemSale: "250 Sale")),
  const Brand(
      name: "Montblanc",
      id: "3",
      img: "assets/img/luxemall1.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: Items(
          itemImg: "assets/img/luxemall1.jpg",
          itemId: "1",
          itemName: "Montblanc",
          itemPrice: "\$ 250",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
  const Brand(
      name: "Davidoff",
      id: "4",
      img: "assets/img/luxemall6.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: Items(
          itemImg: "assets/img/luxemall6.jpg",
          itemId: "1",
          itemName: "Davidoff",
          itemPrice: "\$ 100",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
  const Brand(
      name: "Marc Jacobs",
      id: "5",
      img: "assets/img/luxemall5.jpg",
      desc:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      item: Items(
          itemImg: "assets/img/luxemall5.jpg",
          itemId: "1",
          itemName: "Marc Jacobs",
          itemPrice: "\$ 800",
          itemRatting: "4.5",
          itemSale: "200 Sale")),
];
