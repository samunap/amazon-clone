export class Products {

  id?: number;
  name?: string;
  desc?: string;
  price?: number;
  barcode?: string;
  imageUrl?: string;
  ratings?: number;

  constructor(id?:number, name?: string, desc?: string, price?: number, barcode?:string,imageUrl?:string,ratings?:number){
    this.id =id;
    this.name = name;
    this.desc = desc;
    this.price = price;
    this.barcode = barcode;
    this.imageUrl = imageUrl;
    this.ratings = ratings;
  }




}
