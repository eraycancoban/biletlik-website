import express from "express";
import  {getUsers,deleteUser,updateUser} from "../controllers/user.js"
 
const router = express.Router();

router.get("/get",getUsers)
router.delete("/delete/:id",deleteUser )
router.put("/update/:id", updateUser)

export default router;