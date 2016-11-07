<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property integer $to_lane_id
 * @property integer $from_lane_id
 * @property integer $vehicle_id
 * @property integer $speed
 * @property string $created_at
 * @property string $updated_at
 * @property string $deleted_at
 * @property Lane $lane
 * @property Lane $lane
 * @property Vehicle $vehicle
 */
class Switches extends Model
{
    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

    /**
     * @var array
     */
    protected $fillable = ['to_lane_id', 'from_lane_id', 'vehicle_id', 'speed', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function toLane()
    {
        return $this->belongsTo('App\Lane', 'to_lane_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function fromLane()
    {
        return $this->belongsTo('App\Lane', 'from_lane_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function vehicle()
    {
        return $this->belongsTo('App\Vehicle');
    }
}
