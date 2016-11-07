<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Contracts\Routing\ResponseFactory;
use App\VehicleType;

class ModelController extends Controller
{
    public function modelList()
    {
    	$vehicle_types = VehicleType::distinct()->get();

	    $models = [];
	    foreach ($vehicle_types as $key => $type) {
	    	array_push($models, $type->model);
	    }

	    return response()->json($models,200);
    }
}
