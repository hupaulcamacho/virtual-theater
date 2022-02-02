import React, { useEffect } from 'react';
import { useParams } from 'react-router-dom';

// Css
import '../CSS/Theater.css';

// utilities import
import Youtube from 'react-youtube';
import moment from 'moment';

function Theater () {
    let { id, title, time } = useParams()
    
    const getTimeStamp = () => {
        const format = 'h:mm:ss A';
        let showtime = moment(time, format);
        let duration = moment.duration(moment().diff(showtime));
        return duration.as('seconds');
    }

    const _onReady = (event) => {
        let timestamp = getTimeStamp();
        event.target.playVideo();
        event.target.seekTo(timestamp);
    }
    const loadOptions = () => {
        const opts = {
            // height: '768',
            // width: '1152',
            playerVars: {
			autoplay: 1,
			controls: 0,
			disablekb: 1,
			showinfo: 0,
			fs: 0,
			cc_load_policy: 1,
			modestbranding: 1
          }
        }
        return opts
    }

    return (
        <div className='video-container'>
            {/* <h1>{title}</h1> */}
            <Youtube 
                videoId={id}
                onReady={_onReady}
                opts={loadOptions()}
            />
        </div>
    )
}

export default Theater;