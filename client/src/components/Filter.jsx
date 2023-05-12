import { useEffect } from "react";


function Filter({setActiveCategory, activeCategory, setFiltered, popular}){
    
    useEffect(() => {
        if(activeCategory === 0){
            setFiltered(popular);
            return;
        }
        const filtered = popular.filter((movie) => movie.category === activeCategory);
        setFiltered(filtered);
    }, [activeCategory])
    
    return(
        <div className="filter-container">
            <button className={activeCategory === 0 ? "active" : ""} onClick={() => setActiveCategory(0)}>All</button>
            <button className={activeCategory === 1 ? "active" : ""} onClick={() => setActiveCategory(1)}>Comedy</button>
            <button className={activeCategory === 2 ? "active" : ""} onClick={() => setActiveCategory(2)}>Action</button>
        </div>
    );
}

export default Filter;