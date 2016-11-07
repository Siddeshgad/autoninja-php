<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Contracts\Routing\ResponseFactory;
use App\Signal;

class SignalController extends Controller
{
    public function signalList()
    {
    	$signals = Signal::all();

	    $signal_ids = [];
	    foreach ($signals as $key => $signal) {
	    	array_push($signal_ids, $signal->id);
	    }

	    return response()->json($signal_ids,200);
    }
}
