// import logo from './logo.svg';
import './App.css';
// utilities import
import { Route, Routes } from 'react-router-dom';

// component import
import Navbar from './components/navigation';
import Home from './components/home';
import MovieIndex from './components/movieIndex';
import Theater from './components/theater';

function App() {
  return (
    <div className="App">
      <Navbar />
      <Routes>
        <Route path='/' element={<Home/>}/>
        <Route path='/index' element={<MovieIndex/>}/>
        <Route path='/theater/:id/:title/:time' element={<Theater/>}/>
      </Routes>
    </div>
  );
}

export default App;
