import { Client, Account, Databases, Functions, Storage } from 'appwrite';
import { environment } from 'src/environments/environment';

export class Api {
    private static client: Client | null;
    private static account: Account | null;
    private static db: Databases | null;
    private static functions: Functions | null;
    private static storage: Storage | null;


    static Client() {
        if (this.client) return this.client;
        let client = new Client();
        client
            .setEndpoint(environment.APP_ENDPOINT)
            .setProject(environment.APP_PROJECT)
        this.client = client;
        return client;
    }

    static Account() {
        if (this.account) return this.account;
        let account = new Account(this.Client());
        return account;

    }

    static DB() {
        if (this.db) return this.db;
        let db = new Databases(this.Client());
        return db;
    }

    static Functions() {
        if (this.functions) return this.functions;
        let functions = new Functions(this.Client());
        return functions;
    }

    static Storage(){
        if (this.storage) return this.storage;
        let storage = new Storage(this.Client());
        return storage;
    }
}