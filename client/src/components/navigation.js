import React from 'react';
import { Link } from 'react-router-dom';

function Navigation() {
    return(
        <div className='main-nav'>
            <Link to='/' className='nav-links'>Home</Link>
            <Link to='/index' className='nav-links'>Movie Index</Link>
        </div>
    )
}
export default Navigation;