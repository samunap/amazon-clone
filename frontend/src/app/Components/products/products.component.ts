import { Component, Input, OnInit } from '@angular/core';
import { Product } from 'src/app/SERVICES/product';
import { ShoppingCartService } from '../../SERVICES/shopping-cart.service'

@Component({
  selector: 'app-products',
  templateUrl: './products.component.html',
  styleUrls: ['./products.component.css']
})
export class ProductsComponent implements OnInit {
  @Input()
  products: Product[] = [];

  constructor(private shopping_cart: ShoppingCartService) { }

  ngOnInit(): void {
  }

  addToCart(product: Product){
    this.shopping_cart.addProduct(product);
  }
}
