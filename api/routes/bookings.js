import express from "express";
import  {getTicket,buyTicket,deleteTicket, occSeat} from "../controllers/booking.js"
 
const router = express.Router();

router.post("/buy-ticket",buyTicket)
router.get("/get-ticket",getTicket)
router.delete("/delete/:id",deleteTicket)
router.get("/occSeats/:id",occSeat)





export default router;