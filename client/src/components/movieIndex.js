import React, { useState, useEffect } from 'react';
import Popup from 'reactjs-popup';

// utilities import
import axios from 'axios';
import moment from 'moment';

// component import
import Time from './time';
import Movie from './movie';
import MovieModal from './movieModal'

// CSS
import '../CSS/MovieIndex.css'

function MovieIndex() {
    const [ movies, setMovies ] = useState([]);
    const [ movComponents, setMovComponents ] = useState([]);

    // functions
    const getMovies = async () => {
        try {
            let videos = await axios.get('http://localhost:3002/api/videos/');
            // console.log(videos.data.payload);
            const videoArr = videos.data.payload
            let retrievedMov = [];
            for (let i = 0; i < videoArr.length; i++) {
                let showtimes = await getShowTimes(videoArr[i].id);
                retrievedMov.push({ video: videoArr[i], showtimes: showtimes })
            }
            // videos.data.payload.forEach(async video => {
                
            // })
            console.log(retrievedMov)
            setMovies(retrievedMov)
        } catch (error) {
            console.log('Am error has occured while trying to retrieve videos...')
        }
    }

    const getShowTimes = async (id) => {
        let times;
        try {
            const URL = `http://localhost:3002/api/showtimes/id/${id}`
            times = await axios.get(URL);
        } catch (err) {
            console.log('There was an error...')
        }
        return times.data.payload
    }

    const getElapsedTime = (startTime) => {
        const format = 'h:mm:ss A'
        let now = moment()
        let start = moment(startTime, format)

        return now.diff(start, "minutes")
    }

    const getTimeDifference = (arr) => {
        const format = 'h:mm:ss A'

        const currentTime = moment()
        let timeDiff = {}
        let timeDiffEx = {}

        for (let i = 0; i < arr ?.length; i++) {
            let showtime = moment(arr[i].time, format);
            let difference = showtime.diff(currentTime, "minutes");
            timeDiff[i] = Math.abs(difference)
            timeDiffEx[i] = { difference: Math.abs(difference), showtime: showtime.format(format) };
        }

        let arr2 = Object.values(timeDiff);
        let min = Math.min(...arr2);
        let time = Object.keys(timeDiffEx).find(key => timeDiffEx[key].difference === min);
        let nextshowtime = moment(timeDiffEx[time].showtime, format);
        const next = moment(nextshowtime).format('h:mm A');

        return next
    }

    const _closed = (e) => {
        e.preventDefault()
    }

    const createMovieComponents = (movies) => {
        // console.log(movies)
        const movieComponents = [];
        for (let i = 0; i < movies.length; i++) {
            movieComponents.push(
                <Popup
                    trigger={
                        <div>
                            <Movie 
                                movie={movies[i]}
                                getElapsedTime={getElapsedTime}
                                getTimeDifference={getTimeDifference}
                            />
                        </div>
                    }
                    modal
                    closeOnDocumentClick>
                    <div>
                        <MovieModal 
                            movie={movies[i]} 
                            getElapsedTime={getElapsedTime} 
                            getTimeDifference={getTimeDifference} 
                            _closed={_closed} 
                        />
                    </div>
                </Popup>
            )
        }
        // setMovComponents(movieComponents)
        return movieComponents
    }

    // function calls
    useEffect(() => {
        getMovies();
        // createMovieComponents(movies);
    }, [])

    return (
        <div className='main'>
            <h1>Movie Index</h1>
            <Time />
            <div className="top-movies">
                {createMovieComponents(movies)}
            </div>
        </div>
    )
}

export default MovieIndex;