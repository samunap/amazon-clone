import { LoginService } from './../../SERVICES/login.service';
import { LoginComponent } from './../../Pages/login/login.component';
import { Component, Input, OnInit } from '@angular/core';
import { ShoppingCartService } from 'src/app/SERVICES/shopping-cart.service';



@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {


  username?:string;
  //user: string = this.username.username;



  constructor(public shoppingCart: ShoppingCartService, public loginService: LoginService,public loginComponent:LoginComponent ) {}
  //public altrimenti non è possibile accedervi nell'html


  login(){
    this.loginService.login();
  }

  logout(){
    this.loginService.logout();
  }

  async ngOnInit() {
    }




}
