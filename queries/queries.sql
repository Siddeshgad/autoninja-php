select vehicle_type.wheels as wheels, count(vehicle.vehicle_type_id) as count
from switches
left join vehicle 
on vehicle.id = switches.vehicle_id
left join vehicle_type
on vehicle_type.id = vehicle.vehicle_type_id
where DATE(switches.created_at) = '2016-11-03'
group by vehicle_type.wheels;

select switches.id, switches.from_lane_id, switches.to_lane_id, count(switches.vehicle_id)
from switches 
left join lane
on switches.from_lane_id = lane.id
left join `signal`
on lane.signal_id = signal.id
where signal.id = 2 and DATE(switches.created_at) = '2016-11-03';

select switches.from_lane_id, switches.to_lane_id, count(switches.vehicle_id)
from switches 
left join lane
on lane.id = switches.from_lane_id
where DATE(switches.created_at) = '2016-11-03' and lane.signal_id = 2
group by switches.from_lane_id, switches.to_lane_id;

select signal.id as `signal_id`, vehicle.id, vehicle_type.model
from switches 
left join lane
on lane.id = switches.from_lane_id
left join `signal`
on signal.id = lane.signal_id
left join vehicle
on switches.vehicle_id = vehicle.id
left join vehicle_type
on vehicle.vehicle_type_id = vehicle_type.id
where DATE(switches.created_at) = '2016-11-03' and switches.speed > '50'
group by switches.vehicle_id;

select switches.from_lane_id, switches.to_lane_id, lane.signal_id
from switches 
left join vehicle
on switches.vehicle_id = vehicle.id
left join lane
on lane.id = switches.from_lane_id
where vehicle.reg_no = 'KA03JE9870' and DATE(switches.created_at) = '2016-11-03'
group by lane.signal_id;

/* The above query will result in the entire user path from home to office. First and last record will give us signals closer to home and office location */
