import { motion } from "framer-motion"

function Movie({movie}){
    return(
        <motion.div layout animate={{opacity: 1}} initial={{opacity: 0}} exit={{opacity: 0}}>
            <a href={'http://localhost:3000/moviedetails/?movie_id='+movie.movie_id}><img src={movie.image} alt=""/></a>
            <h2>{movie.title}</h2>
        </motion.div>
    )
}

export default Movie