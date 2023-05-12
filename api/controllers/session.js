import  {db} from "../db.js";


export const getSession = (req, res) => {
    const query= "Select * from  sessions where session_id = ?"
    const value = req.body.session_id;

    db.query(query, value, (err, data) => {
        if (err) return res.json(err);
        return res.json(data);
    })}


    
export const getAll = (req, res) => {
    const query= "Select * from  sessions where movie_id = ? "
    const value = req.body.movie_id;
    db.query(query, value, (err, data) => {
        if (err) return res.json(err);
        return res.json(data);
    })}

    export const getz = (req, res) => {
        const query = "SELECT * FROM sessions"
        db.query(query, (err, data) => {
            if (err) return res.json(err);
            return res.json(data);
        })
    }

    export const deleteS =(req,res)=>{
        const Id=req.params.id;
        const q="DELETE FROM sessions where session_id=?"
        db.query(q,[Id], (err, data) => {
            if (err) return res.json(err);
            return res.json(data);
        })
    }