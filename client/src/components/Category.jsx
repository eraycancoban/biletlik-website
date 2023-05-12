import React, { useEffect, useState } from 'react'
import Movie from './Movie';
import Filter from './Filter';
import { motion, AnimatePresence } from "framer-motion"

function Category() {
    const [popular, setPopular] = useState([]);
    const [filtered, setFiltered] = useState([]);
    const [activeCategory, setActiveCategory] = useState(0);


    useEffect(() => {
        fetchPopular();
    }, []);

    const fetchPopular = async () =>  {
        const data = await fetch("https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&api_key=cb3622f2285ee0cf4be0cac5d819f96c");
        const movies = await data.json();
        setPopular(movies.results);
        setFiltered(movies.results);
    };

    return (
        <div className='category'>
            <Filter popular={popular} setFiltered={setFiltered} activeCategory={activeCategory} setActiveCategory={setActiveCategory}/>
            <motion.div layout className="popular-movies">
                <AnimatePresence>
                {filtered.map((movie) => {
                    return <Movie key={movie.id} movie={movie}/>;
                })}
                </AnimatePresence>
            </motion.div>
        </div>
      );
}


export default Category;