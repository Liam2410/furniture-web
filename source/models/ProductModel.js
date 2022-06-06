const db = require('../db');

module.exports = class Product{

    //Xử lí bất đồng bộ nên dùng callback
    //Nhưng do callback gây ra callback stack
    //Do đó chuyển callback sang promise
    //Tiếp tục chuyển sang promise sang async
    static async getAllProduct(){
        const sql = `SELECT * FROM product LEFT JOIN productsale ON product.id = productsale.idProduct 
        AND productsale.startDateSale <= NOW() AND productsale.endDateSale >= NOW()`;
        
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
            });
        });
    }

    static async getAllProductByType(type){
        const sql = `SELECT * FROM product LEFT JOIN productsale ON product.id = productsale.idProduct 
        AND productsale.startDateSale <= NOW() AND productsale.endDateSale >= NOW() WHERE product.type = ?`;
        const params = [type];

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
            });
        });
    }

    static async getAllRelatedProduct(idProduct, type){
        const sql = `SELECT * FROM product LEFT JOIN productsale ON product.id = productsale.idProduct 
        AND productsale.startDateSale <= NOW() AND productsale.endDateSale >= NOW() WHERE product.id != ? AND product.type = ?`;
        const params = [idProduct, type];

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
            });
        });
    }

    static async getProductById(idProduct){
        const sql = `SELECT * FROM Product LEFT JOIN ProductSale ON Product.id = ProductSale.idProduct 
        AND ProductSale.startDateSale <= NOW() 
        AND ProductSale.endDateSale >= NOW() WHERE Product.id = ?`;
        const params = [idProduct];

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
            });
        });
    }

    static async getProductByName(nameProduct){
        const sql = `SELECT * FROM Product JOIN ProductSale ON Product.id = ProductSale.idProduct 
        AND ProductSale.startDateSale <= NOW() 
        AND ProductSale.endDateSale >= NOW() AND Product.name = ?`;
        const params = [nameProduct];

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
            });
        });
    }

    static async insertNewProduct(productName, productPrice, productQuantity, productType, productDescription, productImage){
        const sql = "INSERT INTO Product (`name`, `price`, `quantity`, `type`, `description`, `productImage`) VALUES (?, ?, ?, ?, ?, ?)";
        const params = [productName, productPrice, productQuantity, productType, productDescription, productImage];

        return await new Promise((resolve, reject) => {
            db.query(sql, params, function (err, result, fields) {
                if(err){
                    reject(err);
                }
                else{
                    resolve(true);
                }
            });
        });
    }

    static async insertProductImage(idProduct, imageName){
        const sql = "INSERT INTO ProductImage(`idProduct`, `additionalImage`) VALUES (?, ?)";
        const params = [idProduct, imageName];

        return await new Promise((resolve, reject) => {
            db.query(sql, params, function (err, result, fields) {
                if(err){
                    reject(err);
                }
                else{
                    resolve(true);
                }
            });
        });
    }

    static async getCommentRatingByIDProduct(idProduct){
        const sql = `SELECT * FROM CommentRating, Account, Product WHERE CommentRating.idProduct = ? AND
        CommentRating.idAccount = Account.id AND CommentRating.idProduct = Product.id`;
        const params = [idProduct];

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
            });
        });
    }

    static async getRatingStarCountByIDProduct(idProduct){
        const sql = `SELECT SUM(IF(CommentRating.ratingPoint = 5, 1, 0)) AS fiveStar, 
        SUM(IF(CommentRating.ratingPoint = 4, 1, 0)) AS fourStar, SUM(IF(CommentRating.ratingPoint = 3, 1, 0)) AS threeStar, 
        SUM(IF(CommentRating.ratingPoint = 2, 1, 0)) AS twoStar, SUM(IF(CommentRating.ratingPoint = 1, 1, 0)) AS oneStar 
        FROM CommentRating WHERE CommentRating.idProduct = ?`;
        const params = [idProduct];

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

    static async getTotalPriceQuantityByIDProduct(idProduct){
        const sql = "SELECT SUM(OrderProduct.productPrice)*OrderProduct.quantityProduct AS totalProductPrice, SUM(OrderProduct.quantityProduct) AS totalQuantity FROM `Order`, `OrderProduct` WHERE `Order`.id = `OrderProduct`.idOrder AND `Order`.status = 'Giao thành công' AND `OrderProduct`.`idProduct` = ?";
        const params = [idProduct];

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

    static async getCountProductSaleByIDProduct(idProduct){
        const sql = `SELECT Product.quantity, COUNT(ProductSale.idProduct) AS countSale 
        FROM Product, ProductSale WHERE Product.id = ProductSale.idProduct`;
        const params = [idProduct];

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

    static async getCustomerOrderSuccessByIDProduct(idProduct){
        const sql = "SELECT * FROM `Account`, `Order`, `OrderProduct` WHERE `Account`.`id` = `Order`.`idAccount` AND `Order`.`id` = `OrderProduct`.`idOrder` AND `Order`.status = 'Giao thành công' AND `OrderProduct`.`idProduct` = ?";
        const params = [idProduct];

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

    static async getAllOrderSuccessByIDProduct(idProduct){
        const sql = "SELECT MONTH(`Order`.`statusChangeDate`) AS month, SUM(`OrderProduct`.`productPrice`) AS monthRevenue FROM `Order`, `OrderProduct` WHERE `Order`.`id` = `OrderProduct`.`idOrder` AND `Order`.`status` = 'Giao thành công' AND YEAR(`Order`.`orderDate`) = YEAR(NOW()) AND `OrderProduct`.`idProduct` = ? GROUP BY MONTH(`Order`.`statusChangeDate`)";
        const params = [idProduct];

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

    static async addCommentRatingToProduct(idAccount, idProduct, commentContent, ratingPoint){
        const sql = "INSERT INTO `CommentRating`(`idAccount`, `idProduct`, `commentContent`, `ratingPoint`) VALUES (?, ?, ?, ?)";
        const params = [idAccount, idProduct, commentContent, ratingPoint];

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

}