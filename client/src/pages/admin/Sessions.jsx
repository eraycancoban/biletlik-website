import React, { useEffect, useState } from 'react'
import SideBar from '../../components/Sidebar'
import SearchBar from '../../components/SearchBar'
import axios from 'axios'

import "./adminpanel.scss"
const Session = () => {

const[sessions,setSessions]=useState([]);

useEffect(()=>{
  const fetchSession= async()=>{
    try{
      const res = await axios.get('http://localhost:8800/sessions/gets')
      setSessions(res.data)
    }
    catch(err){
      console.log(err)
    }
  } 
  fetchSession()
  },[])
  
  const handleDelete= async (id)=>{
    try{
      await axios.delete('http://localhost:8800/sessions/delete/'+id)
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
           <tr className='tableRow'>
            <th>session_id</th>
            <th>movie_id</th>
            <th>screen_id</th>
            <th>start</th>
            <th>end</th>
           </tr>
          {sessions.map(session=>(
          <tr key={session.session_id}>
            <th className="tableCell"><input type="text"  name="" id="" value={session.session_id}/></th>
            <th className="tableCell"><input type="text"  name="" id="" value={session.movie_id}/></th>
            <th className="tableCell"><input type="text"  name="" id="" value={session.screen_id}/></th>
            <th className="tableCell"><input type="text"  name="" id="" value={session.start}/></th>
            <th className="tableCell"><input type="text"  name="" id="" value={session.end}/></th>
            <th  className="tableCell"><input type="button" value="sil" onClick={()=>handleDelete(session.session_id)}/> </th>              
          </tr>
          ))}
          </table>
        </div>
    </div>
    
  )
}

export default Session