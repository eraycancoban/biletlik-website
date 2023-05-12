import React, { useEffect, useState } from 'react'
import SideBar from '../../components/Sidebar'
import SearchBar from '../../components/SearchBar'
import axios from 'axios'

import "./adminpanel.scss"
const Movies = () => {

const[movies,setMovies]=useState([]);

useEffect(()=>{
  const fetchMovie= async()=>{
    try{
      const res = await axios.get('http://localhost:8800/movies/get')
      setMovies(res.data)
    }
    catch(err){
      console.log(err)
    }
  } 
  fetchMovie()
  },[])
  
  const handleDelete= async (id)=>{
    try{
      await axios.delete('http://localhost:8800/movies/delete/'+id)
      window.location.reload()
    }
    catch(err){
      console.log(err)
    }
  }
  return (
    <div className='home'>
      <div><SideBar/></div>
        <div className='homeContainer'>
          <table>
            <tr>
              <th>movie_id</th>
              <th>title</th>
              <th>cast</th>
              <th>duration</th>
              <th>description</th>
              <th>image</th>
              <th>banner</th>
              <th>category</th>
            </tr>
          {movies.map(movie=>(
          <tr key={movie.movie_id}>
            <th className="tableCell" id="id"><input type="text"  name="" id="" value={movie.movie_id}/></th>
            <th className="tableCell"><input type="text"  name="" id="" value={movie.title}/></th>
            <th className="tableCell"><input type="text"  name="" id="" value={movie.cast}/></th>
            <th className="tableCell"><input type="text"  name="" id="" value={movie.duration}/></th>
            <th className="tableCell"><input type="text"  name="" id="" value={movie.description}/></th>
            <th className="tableCell"><input type="text"  name="" id="" value={movie.image}/></th>
            <th className="tableCell"><input type="text"  name="" id="" value={movie.image_banner}/></th>
            <th className="tableCell"><input type="text"  name="" id="" value={movie.category}/></th>
            <th  className="tableCell"><input type="button" value="sil"  onClick={()=>handleDelete(movie.movie_id)} /> </th>    
          </tr>
          ))}
          </table>
        </div>
    </div>
    
  )
}

export default Movies