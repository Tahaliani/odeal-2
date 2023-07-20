import { Models } from 'appwrite';

export type Order = Models.Document & {
    customer_name:string,
    customer_number:string,
    customer_id:string,
    store_id:string,
    product_id:string,
    payment_id:string,
    payment_status:string,
}