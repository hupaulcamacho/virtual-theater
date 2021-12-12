const express = require('express');
const router = express.Router();
const videos = require('../database/queries/videos');

router.get('/', async  (req, res) => {
	try{
		let data = await videos.getAllVideos()
		res.status(200).json({
			status: 'success',
			payload: data
		});
	}
	catch(err){
		console.log(err);
	}
});

router.get('/id/:id', async (req, res) => {
	const id = req.params.id
	try{
		let data = await videos.getVideoById(id)
		res.status(200).json({
			status: 'success',
			payload: data
		});
	}
	catch(err){
		console.log(err);
	}
});

module.exports = router;