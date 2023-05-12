import express from "express";
import  {getSession,getAll,getz,deleteS} from "../controllers/session.js"

 
const router = express.Router();


router.post("/get-session",getSession)
router.get("/get-all",getAll)
router.get("/gets",getz)
router.delete("/delete/:id",deleteS)

export default router;