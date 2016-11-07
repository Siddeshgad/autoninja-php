<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Contracts\Routing\ResponseFactory;
use App\Http\Controllers\DB;
use App\Switches;
use App\Lane;
use App\VehicleType;
use App\Vehicle;

class SearchController extends Controller
{
    public function search(Request $request)
    {
    	if($request->has('date') && $request->has('signal_id'))
    	{
    		$input = $request->all();

	        $lanes = Lane::where('signal_id', $input['signal_id'])
		               ->get();

		    $lane_ids = [];
		    foreach ($lanes as $key => $lane) {
		    	array_push($lane_ids, $lane->id);
		    }

		    $from_lane_ids = $lane_ids;
		    $to_lane_ids = $lane_ids;
		    
		    if(isset($input['from_lane_id']))
		    	$from_lane_ids = array($input['from_lane_id']);

			if(isset($input['to_lane_id']))
		    	$to_lane_ids = array($input['to_lane_id']);

		    if(isset($input['model']))
		    {
		        $vehicles = \DB::table('vehicle')
			            ->join('vehicle_type', 'vehicle_type.id', '=', 'vehicle.vehicle_type_id')
			            ->where('vehicle_type.model', $input['model'])
			            ->select('vehicle.id', 'vehicle_type.model')
			            ->get();

			    $vehicle_ids = array();
			    foreach ($vehicles as $key => $vehicle) {
			    	array_push($vehicle_ids, $vehicle->id);
			    }
		    }

		    $switches = Switches::whereDate('created_at', '=', $input['date'])
		    			->whereIn('from_lane_id', $from_lane_ids)
		    			->whereIn('to_lane_id', $to_lane_ids);

		    if(isset($input['model']))
		    	$switches->whereIn('vehicle_id', $vehicle_ids);          

		    $list = array();
		    foreach ($switches->get() as $key => $switch) {
		    	$record = array();
		    	$record['id'] = $switch->id; 
		    	$record['from'] = $switch->from_lane_id; 
		    	$record['to'] = $switch->to_lane_id; 
		    	$record['speed'] = $switch->speed; 
		    	$record['reg_no'] = $switch->vehicle->reg_no;
		    	$record['wheels'] = $switch->vehicle->vehicleType->wheels;
		    	$record['model'] = $switch->vehicle->vehicleType->model;
		    	array_push($list, $record);
		    }
		    
		    return response()->json($list,200);
    	}
        else
        {
        	return response()->json([
			    'error' => 'Missing date or signal id',
			    'status' => 400
			],400);
        }
    }
}
