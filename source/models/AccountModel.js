const db = require('../db');

module.exports = class Account{

    static async getAccountByID(idAccount){
        const sql = "SELECT * FROM Account WHERE Account.id = ?";
        const params = [idAccount];

        return await new Promise((resolve, reject) => {
            db.query(sql, params, function (err, result, fields) {
                if(err){
                    reject(err);
                }
                else if(result.length > 0){
                    resolve(result[0]);
                }
                else{
                    resolve(null);
                }
            })
        });
    }

    static async getAccountByEmail(email){
        const sql = "SELECT * FROM Account WHERE Account.email = ?";
        const params = [email];

        return await new Promise((resolve, reject) => {
            db.query(sql, params, function (err, result, fields) {
                if(err){
                    reject(err);
                }
                else if(result.length > 0){
                    resolve(result[0]);
                }
                else{
                    resolve(null);
                }
            })
        });
    }


    static async getAllCustomer(){
        const sql = "SELECT * FROM Account WHERE Account.role = 'Customer'";

        return await new Promise((resolve, reject) => {
            db.query(sql, function (err, result, fields) {
                if(err){
                    reject(err);
                }
                else if(result.length > 0){
                    resolve(result);
                }
                else{
                    resolve(null);
                }
            })
        });
    }

    static async getAllCommentByIDAccount(idAccount){
        const sql = `SELECT *, Product.id AS idProduct FROM CommentRating, Account, Product WHERE CommentRating.idAccount = ? AND
        CommentRating.idAccount = Account.id AND CommentRating.idProduct = Product.id`;
        const params = [idAccount];

        return await new Promise((resolve, reject) => {
            db.query(sql, params, function (err, result, fields) {
                if(err){
                    reject(err);
                }
                else if(result.length > 0){
                    resolve(result);
                }
                else{
                    resolve(null);
                }
            })
        });
    }

    static async addNewAccount(email, password, phone, fullname, role, gender, birthday, address){
        const sql = "INSERT INTO `Account` (`email`, `password`, `phone`, `fullname`, `role`, `gender`, `birthday`, `address`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        const params = [email, password, phone, fullname, role, gender, birthday, address];

        return await new Promise((resolve, reject) => {
            db.query(sql, params, function (err, result, fields) {
                if(err){
                    reject(err);
                }
                else if(result.affectedRows > 0){
                    resolve(true);
                }
                else{
                    resolve(false);
                }
            })
        });
    }

}