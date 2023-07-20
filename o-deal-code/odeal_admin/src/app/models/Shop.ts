import { Models } from 'appwrite';

export type Shop = Models.Document & {
    name:string,//
    address:string,
    contact:string,
    category:string,
    image:string,
    decoration_image:string,
    total_products:number,
    total_customer:number,
    total_orders:number,
    offer_claimed:number,
    reviews:number,
}