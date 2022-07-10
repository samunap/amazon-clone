import { Component, OnInit } from '@angular/core';
import { Product } from 'src/app/SERVICES/product';
import { ShoppingCartService } from 'src/app/SERVICES/shopping-cart.service';

@Component({
  selector: 'app-checkout',
  templateUrl: './checkout.component.html',
  styleUrls: ['./checkout.component.css']
})
export class CheckoutComponent implements OnInit {

  items: Product[] = [];

  constructor(public shopping_cart: ShoppingCartService) { }

  ngOnInit(): void {
    this.getShoppingCart()
  }

  getShoppingCart(){
    this.items = this.shopping_cart.getShoppingCartItems();
  }

  deleteEventHandler(p: Product){
    this.getShoppingCart()
  }

}
