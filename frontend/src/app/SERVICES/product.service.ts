import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Product } from './product';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private apiServiceUrl = environment.apiBaseUrl;
  constructor(private Http: HttpClient) { }

  public getProducts(): Observable<Product[]>{
      return this.Http.get<Product[]>('http://localhost:8080/products/all');
  }

  public addProducts(product: Product): Observable<Product>{
    return this.Http.post<Product>('${this.apiServiceUrl}/products/add', product);
  }

  public updateProducts(product: Product): Observable<Product>{
    return this.Http.put<Product>('${this.apiServiceUrl}/products/update', product);
  }

  public deleteProducts(productId: number): Observable<void>{
    return this.Http.delete<void>('${this.apiServiceUrl}/products/delete/${productId}');
  }
}
