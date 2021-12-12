const db = require('../db.js');

getAllVideos = async () => {
    try {
        const videos = await db.any("SELECT * FROM videos");
        return videos;
    } catch (error) {
        console.log(error);
    }
}

getVideoById = async (id) => {
    try {
        const video = await db.any('SELECT * FROM videos where id = $1', [id]);
        return video;
    } catch (error) {
        console.log(error);        
    }
}

module.exports = {
    getAllVideos,
    getVideoById
}