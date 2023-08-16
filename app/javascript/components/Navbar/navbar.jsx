import './Navbar.css';
import React from 'react';
import { Link } from "react-router-dom";


const Navbar = () => {
    const imageUrl = "https://media.istockphoto.com/id/1038356020/vector/restaurant-icon.jpg?s=612x612&w=0&k=20&c=Tk_v3JuJA4lz_8ZRJi78xS4p75Idqt97uEtYJciVtFI=";
    return (
      <nav className="nav">
        <ul>
            <li>
                <Link to="/">
                    <img src={imageUrl} alt="Home" />
                </Link>
            </li>
            <li className='site-title'>
                My Food Reviews    
            </li>
        </ul>
      </nav>
    );
  };
  
  

export default Navbar;

