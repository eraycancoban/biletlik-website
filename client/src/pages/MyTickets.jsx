import React ,{useState,useEffect} from 'react'
import Navbar from '../components/Navbar'
import Footer from "../components/Footer"
import axios from 'axios'
import { Link } from "react-router-dom";
import { AuthContext } from '../context/authContext';
import { useContext } from 'react';

const MyTickets = () => {

  const [tickets,setTickets]= useState([])
  const {currentUser} = useContext(AuthContext);
  useEffect(()=>{
  const fetchMovie= async()=>{
    try{
      const res = await axios.get('http://localhost:8800/bookings/myTickets/'+currentUser.user_id)
      setTickets(res.data)
    }
    catch(err){
      console.log(err)
    }
  } 
  fetchMovie()
  },[])



  return (
    <div className='movie-details'>
      <Navbar/>
      
 {tickets.map(ticket=>(
          <div key={ticket.booking_id}>
            <h4 className="film-text"></h4>
            <p className="film_detail-text">Film: {ticket.title}</p>
            <p className="film_detail-text">Salon: {ticket.name}</p>
            <p className="film_detail-text">Seans: {ticket.session_id}</p>
            <p className="film_detail-text">Koltuk: {ticket.seat_number}</p>
          </div>
         ))} 
          
        
    </div>
   
  )

}
export default MyTickets