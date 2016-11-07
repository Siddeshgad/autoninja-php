<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Contracts\Routing\ResponseFactory;
use App\Lane;

class LaneController extends Controller
{
    public function laneList($id)
    {
    	$lanes = Lane::where('signal_id', $id)
		               ->get();

	    $lane_ids = [];
	    foreach ($lanes as $key => $lane) {
	    	array_push($lane_ids, $lane->id);
	    }

	    return response()->json($lane_ids,200);
    }
}
