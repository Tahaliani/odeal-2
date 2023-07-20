import { Models } from 'appwrite';

export type Review = Models.Document & {
    name:string,
    image:string,
    mega:boolean,
}