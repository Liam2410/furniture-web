const db = require('../db');

module.exports = class Cart{

    static async getCartByIdAccount(idAccount){
        const sql = "SELECT * FROM `Cart` LEFT JOIN `Product` ON Cart.idProduct = Product.id LEFT JOIN productsale ON product.id = productsale.idProduct AND productsale.startDateSale <= NOW() AND productsale.endDateSale >= NOW() WHERE Cart.idAccount = ?";
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

    static async addQuantityProductCart(idAccount, idProduct){
        const sql = "UPDATE `Cart` SET Cart.quantityProduct = Cart.quantityProduct + 1 WHERE Cart.idAccount = ? AND Cart.idProduct = ?;";
        const params = [idAccount, idProduct];

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

    static async minusQuantityProductCart(idAccount, idProduct){
        const sql = "UPDATE `Cart` SET Cart.quantityProduct = Cart.quantityProduct - 1 WHERE Cart.idAccount = ? AND Cart.idProduct = ?;";
        const params = [idAccount, idProduct];

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

    static async deleteProductFromCart(idAccount, idProduct){
        const sql = "DELETE FROM `Cart` WHERE Cart.idAccount = ? AND Cart.idProduct = ?;";
        const params = [idAccount, idProduct];

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

    static async deleteCartByIdAccount(idAccount){
        const sql = "DELETE FROM `Cart` WHERE Cart.idAccount = ?";
        const params = [idAccount];

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

    static async getNumberOfCartByIDAccount(idAccount){
        const sql = "SELECT COUNT(*) AS SoLuong FROM `Cart` WHERE Cart.idAccount = ? GROUP BY Cart.idAccount";
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

    static async addProductToCart(idAccount, idProduct, quantityProduct){
        const sql = "INSERT INTO `Cart`(`idAccount`, `idProduct`, `quantityProduct`) VALUES (?, ?, ?)";
        const params = [idAccount, idProduct, quantityProduct];

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