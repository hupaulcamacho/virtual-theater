import React, { Component } from 'react'
import { Link } from 'react-router-dom'
// import randomString from 'randomstring';

class MovieModal extends Component {
    state = {
        difference: this.props.getTimeDifference(this.props.movie.showtimes),
        movie: this.props.movie,
        // privateId: randomString.generate(10),
        title: this.props.title
    }

    componentDidMount = async () => {
        this.interval = setInterval(() => this.setState({ difference: this.props.getTimeDifference(this.props.movie.showtimes) }), 1000);
    }

    componentWillUnmount() {
        clearInterval(this.interval);
    }

    copyCodeToClipboard = () => {
        const el = this.textArea
        el.select()
        document.execCommand("copy")
    }

    render() {
        const { difference, movie, privateId, title } = this.state
        return (
            <div className="movie2">
                <div className="info1">
                    <h3 className="mv-title">{movie.video.title}</h3>
                    <img className="movie-img" src={movie.video.img_url} alt={movie.video.title}/>
                    <p>Runtime: {movie.video.runtime}</p>
                    {(
                        this.props.getElapsedTime(difference) < 0 ?
                            <>
                            </>
                            :
                            <>
                                <p className="text">Started At {difference}</p>
                                <p className="text">Time Elapsed: {this.props.getElapsedTime(difference)} mins</p>
                                <p className="now-live">Live</p>
                            </>
                    )}
                </div>
                <div className="info2">
                    <p className="description">{movie.video.description}</p>
                    {(
                        this.props.getElapsedTime(difference) < 0 ?
                            // <Link onClick={e => this.props._closed(e)} className='movie-link'>Closed</Link>
                            <a className='movie-link'>Closed</a>
                            :
                            <div>
                                <div className='link-container'>
                                    <Link
                                        className='movie-link'
                                        to={`/showroom/${movie.video_url}/${title}/${difference}`}>
                                        Enter Theater
                                    </Link>
                                </div>
                            </div>
                    )}
                </div>
            </div>
        )
    }
}

export default MovieModal