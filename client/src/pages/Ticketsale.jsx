import React,{ useContext ,useEffect, useState} from 'react'
import { AuthContext } from '../context/authContext';
import axios from 'axios';


const Ticketsale = () => {
  const {currentUser} = useContext(AuthContext);
  const urlParams = new URLSearchParams(window.location.search);
  const id = urlParams.get('session_id');
  const [err,setError] = useState(false)
  const [occupiedSeat,setOccupiedSeats] = useState([]);
  const occupiedSeats = occupiedSeat.map(seat => seat.seat_number-1);

  const [selectedSeats, setSelectedSeats] = React.useState([]);
  const [seatNumbers, setSeatNumbers] = React.useState([...Array(48)].map((_, index) => index + 1));
  const [ticket,setTickets] = useState({
    user_id:currentUser.user_id,
    session_id:id,
    seat_number:null,
  });
  
  useEffect(()=>{
    const fetchSeat= async()=>{
      try{
        const res = await axios.get('http://localhost:8800/bookings/occSeats/'+id)
        setOccupiedSeats(res.data)
      }
      catch(err){
        console.log(err)
      }
    } 
    fetchSeat()
    },[])
    

  const handleSeatClick = (index) => {
    if (selectedSeats.includes(index)) {
      setSelectedSeats(selectedSeats.filter((seat) => seat !== index));
    } else {
      setSelectedSeats([...selectedSeats, index]);
    }
  };

  const getSeatClassName = (index) => {
    if(occupiedSeats.includes(index))  {
      return "occupied";
    } else if (selectedSeats.includes(index)) {
      return "selected";
    } else {
      return "";
    }
  };

  ticket.seat_number=selectedSeats[0]+1;
  console.log(ticket)

  const handleClick = async e =>{
    try{
      await axios.post("http://localhost:8800/bookings/buy-Ticket",ticket);
      console.log("Ticket Succesfully Bought");
      window.location.reload()
    }
    catch{
      setError(err.response.data)}
  }


  return (
    <div className='background-ts'>
        <h1>
          <span className="beyaz-text">BILET</span>
          <span className="sari-text">LIK</span>
        </h1>
        <meta charSet="UTF-8" />
        <meta httpEquiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/style-ks.css" />
        <div className="movie-container">
        </div>
        <ul className="showcase">
          <li>
            <div className="seat" />
            <small>Boş</small>
          </li>
          <li>
            <div className="seat selected" />
            <small>Seçtiğiniz</small>
          </li>
          <li>
            <div className="seat occupied" />
            <small>Dolu</small>
          </li>
        </ul>
        <div className="container-ticketsale">
          <div className="screen" />
          <div className="row">
          {[...Array(8)].map((_, index) => (
            <div
              key={index}
              className={`seat ${getSeatClassName(index)}`}
              onClick={() => handleSeatClick(index)}
            > <span className="seat-number">{seatNumbers[index]}</span>
              </div>
          ))}
          </div>
          <div className="row">
          {[...Array(8)].map((_, index) => (
            <div
              key={index + 8}
              className={`seat ${getSeatClassName(index+8)}`}  
              onClick={() => handleSeatClick(index + 8)}
            ><span className="seat-number">{seatNumbers[index + 8]}</span>
              </div>
          ))}
          </div>
          <div className="row">
          {[...Array(8)].map((_, index) => (
            <div
              key={index + 16}
              className={`seat ${getSeatClassName(index+16)}`}
              onClick={() => handleSeatClick(index + 16)}
            ><span className="seat-number">{seatNumbers[index + 16]}</span>
              </div>
          ))}
          </div>
          <div className="row">
          {[...Array(8)].map((_, index) => (
            <div
              key={index + 24}
              className={`seat ${getSeatClassName(index+24)}`}
              onClick={() => handleSeatClick(index + 24)}
            ><span className="seat-number">{seatNumbers[index + 24]}</span>
            </div>
          ))}
          </div>
          <div className="row">

          </div>
          <div className="row">

          </div>
          <button onClick={handleClick}>Satın Al</button>
        </div>
        
      </div> 
  )
}

export default Ticketsale