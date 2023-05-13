import React, { useEffect, useState } from 'react'
import SideBar from '../../components/Sidebar'
import SearchBar from '../../components/SearchBar'
import axios from 'axios'

import "./adminpanel.scss"
const AdminPanel = () => {

const[users,setUsers]=useState([]);
const[user,setUser]=useState([]);

const handleDelete= async (id)=>{
  try{
    await axios.delete('http://localhost:8800/users/delete/'+id)
    window.location.reload()
  }
  catch(err){
    console.log(err)
  }
}


useEffect(()=>{
  const fetchUser= async()=>{
    try{
      const res = await axios.get('http://localhost:8800/users/get')
      setUsers(res.data)
    }
    catch(err){
      console.log(err)
    }
  } 
  fetchUser()
  },[])

  return (
    <div className='home'>
      <div><SideBar/></div>
        <div className='homeContainer'>

          <table>
          <tr className='tableRow'>
            <th>user_id</th>
            <th>username</th>
            <th>email</th>
            <th>password</th>
            <th></th>

            </tr>
            <tr>
              <th className="tableCell"><input type="text" name="username" id="" /></th>
              <th className="tableCell"><input type="text" name="email" id="" /></th>
              <th className="tableCell"><input type="text" name="password" id="" /></th>
              <th className="tableCell"><input type="button" value="ekle" /></th>
            </tr>
          
         

          </table>
          <table>
          <tr className='tableRow'>
            <th>user_id</th>
            <th>username</th>
            <th>email</th>
            <th>password</th>
            <th></th>

          </tr>
          {users.map(user=>(
          <tr key={user.user_id}>
            <th  className="tableCell"> <input type="text" name="user_id" id="" value={user.user_id} /></th>
            <th  className="tableCell"><input type="text" name="username" id="" value={user.username}  /></th>
            <th  className="tableCell"><input type="text" name="email" id="" value={user.email}  /></th>
            <th  className="tableCell"><input type="text" name="password" id="" value={user.password}  /></th>          
            <th  className="tableCell"><input type="button" value="sil" onClick={()=>handleDelete(user.user_id)} /> </th>       
            </tr>
          ))}
          </table>
        </div>
    </div>
    
  )
}

export default AdminPanel