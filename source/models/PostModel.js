const db = require('../db');

module.exports = class Post{

    static async createNewPost(title, tag, postImage, description, content, idAuthor){
        const sql = "INSERT INTO `Post` (`title`, `tag`, `postImage`, `description`, `content`, `idAuthor`) VALUES (?, ?, ?, ?, ?, ?)";
        const params = [title, tag, postImage, description, content, idAuthor];

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

    static async getAllPost(){
        const sql = "SELECT *, `Post`.id AS idPost FROM `Post`, `Account` WHERE `Post`.idAuthor = `Account`.id";

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

    static async getPostByID(idPost){
        const sql = "SELECT *, `Post`.id AS idPost FROM `Post`, `Account` WHERE `Post`.idAuthor = `Account`.id AND `Post`.id = ?"
        const params = [idPost];

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

    static async updatePost(idPost, title, tag, postImage, description, content){
        const sql = "UPDATE `Post` SET `Post`.title = ?, `Post`.tag = ?, `Post`.postImage = ?, `Post`.description = ?, `Post`.content = ? WHERE `Post`.id = ?";
        const params = [title, tag, postImage, description, content, idPost];

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

    static async updatePostWithoutImage(idPost, title, tag, description, content){
        const sql = "UPDATE `Post` SET `Post`.title = ?, `Post`.tag = ?, `Post`.description = ?, `Post`.content = ? WHERE `Post`.id = ?";
        const params = [title, tag, description, content, idPost];

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

    static async deletePostById(idPost){
        const sql = "DELETE FROM `Post` WHERE `Post`.id = ?";
        const params = [idPost];

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