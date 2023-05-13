import React ,{useState,useEffect,useContext } from 'react'
import Navbar from '../components/Navbar'
import Footer from "../components/Footer"
import axios from 'axios'
import { AuthContext } from '../context/authContext';
import { Link } from "react-router-dom";



const Accountdetails = () => {


  const [detail,Setdetails]= useState([])
  const {currentUser} = useContext(AuthContext);
  const [users,setUser] = useState({
    oldPassword:"",
    newPassword:"",
  })

  useEffect(()=>{
  const fetchDetail= async()=>{
    try{
      const res = await axios.get('http://localhost:8800/users/getdetails/'+currentUser.user_id)
      Setdetails(res.data)
    }
    catch(err){
      console.log(err)
    }
  } 
  fetchDetail()
  },[])


  const handleChange = e =>{
    setUser((prev=>({...prev,[e.target.name]:e.target.value})))
  }


  const handleClick = async e =>{
    e.preventDefault()
    try {
      await axios.put("http://localhost:8800/auth/changepass/"+currentUser.user_id,users)
      console.log("degisti")
    } catch (err) {
      console.log(err)
    }
  }
  

  return (
    
    <div>
     <Navbar/>  
     <div>
      <h2>Uyelik Bilgileri</h2>
      {detail.map(d=>(
          <div className='details-movie'>
            <h4 className="film-text"></h4>
            <p className="film_detail-text">Kullanıcı Adı: {d.username}</p>
            <p className="film_detail-text">E-Posta Adresi: {d.email}</p>
          </div>
         ))} 
    <form>
      <input type="Text" placeholder='Old Password' onChange={handleChange}  name='oldPassword'/>
      <input type="text" placeholder='Password' onChange={handleChange}  name='newPassword'/>
      <button onClick={handleClick}>Degistir</button>
      
    </form>
     </div>
      <Footer/>
    </div>
  )
}

export default Accountdetails