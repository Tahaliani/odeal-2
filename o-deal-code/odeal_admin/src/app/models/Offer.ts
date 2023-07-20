import { Models } from 'appwrite';

export type Offer = Models.Document & {
    name:string,
    product_id:string,
    store_id:string,
    description:string,
    discount:number,
    discount_type:string,
    other_offer:string,
    start_time:string,
    end_time:string,
    weekdays:string,
    start_date:string,
    end_date:string,
    just_for_today:boolean,
    draft:boolean,
}