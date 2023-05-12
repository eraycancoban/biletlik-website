import express from "express";
import { addMovie, getBanners,getPosters,getMovie,getz,deleteM } from "../controllers/movie.js";

const router = express.Router();


router.get("/get",getz)

router.post("/movie",addMovie)

router.get("/posters",getPosters)

router.get("/banners",getBanners)

router.get("/movie/:movie_id",getMovie)

router.delete("/delete/:id",deleteM)

export default router;