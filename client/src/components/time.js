import React, { useState, useEffect } from 'react';

// import utilities
import moment from 'moment';

function Time (){
    const [ time, setTime ] = useState('');

    useEffect(() => {
        const interval = setInterval(() => setTime(moment().format('h:mm:ss A')), 1000);
        return () => clearInterval(interval);
    }, [])

    return (
        <div>
            {time}
        </div>
    )

}

export default Time;
