const db = require('../db');

module.exports = class Order{

    static async getAllOrder(){
        const sql = "SELECT *, `Order`.id AS idOrder, `Account`.id AS idAccount FROM `Order`, `Account` WHERE `Order`.idAccount = `Account`.id";

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

    static async getAllOrderByIDAccount(idAccount){
        const sql = "SELECT *, `Order`.id AS idOrder, `Account`.id AS idAccount FROM `Order`, `Account` WHERE `Order`.idAccount = `Account`.id AND `Order`.idAccount = ?";
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

    static async getOrderByID(id){
        const sql = "SELECT *, `Order`.id AS idOrder FROM `Order` WHERE `Order`.id = ?";
        const params = [id];

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

    static async getOrderOfUser(idAccount){
        const sql = "SELECT *, `Order`.id AS idOrder FROM `Order`, `OrderProduct`, `Product`, `Account` WHERE `OrderProduct`.idProduct = `Product`.id AND `OrderProduct`.idOrder = `Order`.`id` AND `Account`.`id` = `Order`.`idAccount` AND `Account`.`id` = ?";
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

    static async getOrderProductByIDOrder(idOrder){
        const sql = "SELECT * FROM `OrderProduct`, `Product` WHERE `OrderProduct`.idProduct = `Product`.id AND `OrderProduct`.idOrder = ?";
        const params = [idOrder];

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

    static async updateOrderStatusByIDOrder(idOrder, status){
        const sql = "UPDATE `Order` SET `Order`.status = ?, `Order`.statusChangeDate = NOW() WHERE `Order`.id = ?";
        const params = [status, idOrder];

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

    static async updateShippingFeeByIDOrder(idOrder, shippingFee){
        const sql = "UPDATE `Order` SET `Order`.shippingFee = ? WHERE `Order`.id = ?";
        const params = [shippingFee, idOrder];

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

    static async deleteOrderByIDOrder(idOrder){
        const sql = "DELETE FROM `Order` WHERE `Order`.id = ?";
        const params = [idOrder];

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

    static async getNewestOrderByIDAccount(idAccount){
        const sql = "SELECT *, `Order`.id AS idOrder, `Account`.id AS idAccount FROM `Order`, `Account` WHERE `Order`.idAccount = `Account`.id AND `Order`.idAccount = ? ORDER BY `Order`.`orderDate` DESC";
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

    static async addNewOrder(idAccount, note, shippingAddress, totalPrice){
        const sql = "INSERT INTO `Order`(`idAccount`, `note`, `shippingAddress`, `totalPrice`) VALUES (?, ?, ?, ?)";
        const params = [idAccount, note, shippingAddress, totalPrice];

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

    static async addNewOrderProduct(idOrder, idProduct, productPrice, quantityProduct){
        const sql = "INSERT INTO `OrderProduct`(`idOrder`, `idProduct`, `productPrice`, `quantityProduct`) VALUES (?, ?, ?, ?)";
        const params = [idOrder, idProduct, productPrice, quantityProduct];

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

    static async checkExistOrderUserProduct(idAccount, idProduct){
        const sql = "SELECT * FROM `Order`, `OrderProduct` WHERE `Order`.id = `OrderProduct`.idOrder AND `Order`.`idAccount` = ? AND `OrderProduct`.`idProduct` = ? AND `Order`.`status` = 'Giao thành công'";
        const params = [idAccount, idProduct];

        return await new Promise((resolve, reject) => {
            db.query(sql, params, function (err, result, fields) {
                if(err){
                    reject(err);
                }
                else if(result.length > 0){
                    resolve(true);
                }
                else{
                    resolve(false);
                }
            })
        });
    }

}


   