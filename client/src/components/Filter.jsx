import { useEffect } from "react";


function Filter({setActiveCategory, activeCategory, setFiltered, popular}){
    
    useEffect(() => {
        if(activeCategory === 0){
            setFiltered(popular);
            return;
        }
        const filtered = popular.filter((movies) => movies.genre_ids.includes(activeCategory));
        setFiltered(filtered);
    }, [activeCategory])
    
    return(
        <div className="filter-container">
            <button className={activeCategory === 0 ? "active" : ""} onClick={() => setActiveCategory(0)}>All</button>
            <button className={activeCategory === 35 ? "active" : ""} onClick={() => setActiveCategory(35)}>Comedy</button>
            <button className={activeCategory === 28 ? "active" : ""} onClick={() => setActiveCategory(28)}>Action</button>
        </div>
    );
}

export default Filter;