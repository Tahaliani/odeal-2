import { Models } from 'appwrite';

export type Product = Models.Document & {
    name:string,
    storeId:string,
    offerPrice:number,
    price:number,
    description:string,
    image:string,
    galery: any,
    rating:number,
}