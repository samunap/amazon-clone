import { Product } from './product';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ShoppingCartService {

  shopping_cart_items: Product[] = [];

  constructor() { }

  addProduct = (product: Product)=> {
    let items = this.getShoppingCartItems();
    if(items){ // se esistono items
      items.push(product)
      localStorage.setItem('shopping_cart', JSON.stringify(items))
    }
    else{
      this.shopping_cart_items.push(product);
      localStorage.setItem('shopping_cart', JSON.stringify(this.shopping_cart_items));
    }
  }

  getShoppingCartItems = ()=> {
    let items = localStorage.getItem('shopping_cart')
    if(items)
      return JSON.parse(items)
  }

  getCartLength = ()=>{
    let items = this.getShoppingCartItems();
    return items? this.getShoppingCartItems().length: 0
  }

  getTotal = ()=>{
    let items = this.getShoppingCartItems();
    let tot = 0;
    for(let i=0; i<items.length; i++){
      tot += items[i].price;
    }
    return tot;
  }

  removerItem = (p: Product)=>{
    console.log('Rimuovendo il prodotto', p)
    let items = this.getShoppingCartItems();
    const index = items.findIndex((item: { id: any; }) => item.id == p.id)
    if(index >= 0){
      items.splice(index, 1);
      return localStorage.setItem('shopping_cart', JSON.stringify(items))
    }
  }

}
