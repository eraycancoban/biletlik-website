import  {db} from "../db.js";
import bcrypt from "bcryptjs";
import jwt from 'jsonwebtoken';
import {config}  from "../config/auth.config.js"


export const register =  (req, res) => {
    //kullanici varmi kontrol et
    const q="Select * From users Where username = ? OR email = ?"

    db.query(q,[req.body.username, req.body.email], (err, data) => {
        if (err) return res.json(err);
        if (data.length) return res.status(409).json("Bu kullanıcı adı ya da email adresi kullanılıyor");
        // sifreyi hasle
        const salt = bcrypt.genSaltSync(10);
        const hash = bcrypt.hashSync(req.body.password, salt)

        //kayit
        const q2 = "INSERT INTO users (`username`,`email`,`password`) VALUES (?)"
        const values = [
            req.body.username,
            req.body.email,
            hash,
           ]

        db.query(q2, [values], (err, data) => {
            if (err) return res.json(err);
            return res.status(200).json("kullanici eklendi");
        })
    })

}

export const login = (req, res) => {
    const q="Select * From users Where username = ? "

    db.query(q,[req.body.username], (err, data) => {
        if (err) return res.json(err);
        if (data.length === 0 ) return res.status(404).json("Kullanici bulunamadi");
        

        const isPasswordCorrect = bcrypt.compareSync(
            req.body.password,
            data[0].password
            );
        
        if (!isPasswordCorrect) return res.status(400).json("Parola hatası");
        

        const token = jwt.sign({id:data[0].user_id},config.secret,{expiresIn:86400})
        const {password, ...other}=data[0]
        
        res
            .cookie("access_token", token, {
                httpOnly:true
            })
            .status(200)
            .json(other);
    })


}   

export const logout = (req, res) => {
    res.clearCookie("access_token",{
      sameSite:"none",
      secure:true
    }).status(200).json("User has been logged out.")
  };